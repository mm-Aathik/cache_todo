import 'package:flutter/material.dart';

class TodoInput extends StatelessWidget {
  final Function(String) onAdd;

  const TodoInput({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter To-Do',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                onAdd(_controller.text.trim());
                _controller.clear();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
