import 'package:flutter/material.dart';

class TodoDisplay extends StatelessWidget {
  final List<String> todos;

  const TodoDisplay({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index]),
        );
      },
    );
  }
}
