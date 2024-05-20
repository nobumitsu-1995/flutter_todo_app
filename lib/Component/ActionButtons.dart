import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Component/Dialog.dart';
import 'package:flutter_todo_app/pages/todo_create_edit_page.dart';

import '../model/todo.dart';

class ActionButtons extends StatefulWidget {
  final Todo todo;
  const ActionButtons({super.key, required this.todo});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TodoCreateEditPage(todo: widget.todo,)
              ));
            },
            icon: const Icon(Icons.edit)
        ),
        IconButton(
            onPressed: () {
              showDialog<void>(
                  context: context,
                  builder: (_) {
                    return DeleteTodoDialog(id: widget.todo.id,);
                  }
              );
            },
            icon: const Icon(Icons.delete)
        ),
      ],
    );
  }
}
