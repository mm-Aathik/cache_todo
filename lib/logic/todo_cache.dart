import 'package:shared_preferences/shared_preferences.dart';

class TodoCache {
  final String _key = 'todos';

  Future<List<String>> getTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todos = prefs.getStringList(_key) ?? [];
      print('Successfully retrieved todos: $todos');
      return todos;
    } catch (e) {
      print('Error getting todos: $e');
      return [];
    }
  }

  Future<void> addTodo(String todo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todos = await getTodos();
      todos.add(todo);
      await prefs.setStringList(_key, todos);
      print('Successfully added todo: $todo');
    } catch (e) {
      print('Error adding todo: $e');
    }
  }
}
