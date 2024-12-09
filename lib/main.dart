import 'package:flutter/material.dart';
import 'ui/todo_input.dart';
import 'ui/todo_display.dart';
import 'logic/todo_cache.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple To-Do',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoCache _cache = TodoCache();
  List<String> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todos = await _cache.getTodos();
    setState(() {
      _todos = todos;
    });
  }

  void _addTodo(String todo) async {
    await _cache.addTodo(todo);
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple To-Do')),
      body: Column(
        children: [
          TodoInput(onAdd: _addTodo),
          Expanded(child: TodoDisplay(todos: _todos)),
        ],
      ),
    );
  }
}
