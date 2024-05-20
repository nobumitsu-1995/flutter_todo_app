import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Component/ActionButtons.dart';
import 'package:flutter_todo_app/model/todo.dart';

class TodoDetailPage extends StatefulWidget {
  final Todo todo;
  const TodoDetailPage({super.key, required this.todo});

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TODO詳細'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Row(
                children: [
                  const Text('作成日時'),
                  Text(': ${widget.todo.createdAt.toDate().toString().split(' ')[0]}')
                ],
              ),
              Row(
                children: [
                  const Text('更新日時'),
                  Text(': ${widget.todo.updatedAt != null ? widget.todo.updatedAt!.toDate().toString().split(' ')[0] : '-'}')
                ],
              ),
              const SizedBox(height: 12,),
              Text(
                widget.todo.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Divider(),
              Text(widget.todo.detail),
              const Divider(),
              ActionButtons(todo: widget.todo)
            ],
          ),
        ),
      ),
    );
  }
}
