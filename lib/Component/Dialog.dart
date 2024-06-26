import 'package:flutter/material.dart';
import 'package:flutter_todo_app/API/delete_todo.dart';

class DeleteTodoDialog extends StatelessWidget {
  final String id;
  final String title;
  const DeleteTodoDialog ({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('「$title」を削除します。'),
      actions: [
        GestureDetector(
          child: const Text('いいえ'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: const Text('削除する'),
          onTap: () async{
            Navigator.pop(context, 'OK');
            await deleteTodo(id);
          },
        )
      ]
    );
  }
}
