import 'package:flutter/material.dart';
import 'package:flutter_todo_app/API/todo_service.dart';

class DeleteTodoDialog extends StatelessWidget {
  final String id;
  const DeleteTodoDialog ({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('todoを削除します。'),
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
