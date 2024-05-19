import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/API/todo_collection.dart';
import 'package:flutter_todo_app/model/todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TODO一覧'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: todoCollection.snapshots(),
        builder: (context, snapshot) {
          // todo取得中にローディングUIを表示する。
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          // データが空の場合
          if (!snapshot.hasData) {
            return const Text('TODOはありません。');
          }
          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
              final Todo todo = Todo(
                id: docs[index].id,
                title: data['title'],
                detail: data['detail'],
                isComplete: data['isComplete'],
                createdAt: data['createdAt'],
                updatedAt: data['updatedAt']
              );

              return ListTile(
                title: Text(todo.title),
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
