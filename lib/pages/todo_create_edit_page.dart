import 'package:flutter/material.dart';
import 'package:flutter_todo_app/API/create_todo.dart';

class TodoCreateEditPage extends StatefulWidget {
  const TodoCreateEditPage({super.key});

  @override
  State<TodoCreateEditPage> createState() => _TodoCreateEditPageState();
}

class _TodoCreateEditPageState extends State<TodoCreateEditPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TODO作成')
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'タイトル'
                ),
                controller: titleController,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: '詳細'
                ),
                controller: detailController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await createTodo(titleController.text, detailController.text);
                },
                child: const Text('新規作成')
              )
            ],
          ),
        ),
      ),
    );
  }
}
