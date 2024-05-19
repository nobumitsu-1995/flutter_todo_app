import 'package:flutter/material.dart';
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
        child: Text(widget.todo.title),
      ),
    );
  }
}
