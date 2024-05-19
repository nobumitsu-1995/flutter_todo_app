import 'package:flutter/material.dart';
import 'package:flutter_todo_app/API/create_todo.dart';
import 'package:flutter_todo_app/API/update_todo.dart';
import 'package:flutter_todo_app/model/todo.dart';

class TodoCreateEditPage extends StatefulWidget {
  final Todo? todo;
  const TodoCreateEditPage({super.key, this.todo});

  @override
  State<TodoCreateEditPage> createState() => _TodoCreateEditPageState();
}

class _TodoCreateEditPageState extends State<TodoCreateEditPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    isEdit = widget.todo != null ? true : false;

    if (isEdit) {
      titleController.text = widget.todo!.title;
      detailController.text = widget.todo!.detail;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(isEdit ? 'TODO編集' : 'TODO作成')
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
                  if (isEdit) {
                    await updateTodo(
                      widget.todo!.id,
                      titleController.text,
                      detailController.text
                    );
                  } else {
                    await createTodo(
                      titleController.text,
                      detailController.text
                    );
                  }
                },
                child: Text(isEdit ? '更新' : '新規作成')
              )
            ],
          ),
        ),
      ),
    );
  }
}
