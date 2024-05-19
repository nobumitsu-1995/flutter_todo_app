import 'package:flutter/material.dart';

class TodoCreateEditPage extends StatefulWidget {
  const TodoCreateEditPage({super.key});

  @override
  State<TodoCreateEditPage> createState() => _TodoCreateEditPageState();
}

class _TodoCreateEditPageState extends State<TodoCreateEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TODO作成')
      ),
    );
  }
}
