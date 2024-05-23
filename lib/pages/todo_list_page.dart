import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/API/todo_collection.dart';
import 'package:flutter_todo_app/API/update_is_complete.dart';
import 'package:flutter_todo_app/Component/ActionButtons.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/pages/todo_create_edit_page.dart';
import 'package:flutter_todo_app/pages/todo_detail_page.dart';

import '../Component/Dialog.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('TODO一覧'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '未実施',),
              Tab(text: '完了済',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: todoCollection.where('isComplete', isEqualTo: false).snapshots(),
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
                    final id = docs[index].id;
                    final Todo todo = Todo(
                      id: id,
                      title: data['title'],
                      detail: data['detail'],
                      isComplete: data['isComplete'],
                      createdAt: data['createdAt'],
                      updatedAt: data['updatedAt']
                    );

                    return ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (bool? value) async{
                          await updateIsComplete(id, true);
                          final snackBar = SnackBar(
                            backgroundColor: Colors.blueAccent,
                            content: Text("${todo.title}を「完了済」にしました。"),
                          );
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TodoDetailPage(todo: todo)
                        ));
                      },
                      title: Text(todo.title),
                      trailing: ActionButtons(todo: todo,),
                    );
                  }
                );
              }
            ),
            StreamBuilder<QuerySnapshot>(
              stream: todoCollection.where('isComplete', isEqualTo: true).snapshots(),
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
                    final id = docs[index].id;
                    final Todo todo = Todo(
                      id: id,
                      title: data['title'],
                      detail: data['detail'],
                      isComplete: data['isComplete'],
                      createdAt: data['createdAt'],
                      updatedAt: data['updatedAt']
                    );

                    return ListTile(
                      leading: Checkbox(
                        value: true,
                        onChanged: (bool? value) async{
                          await updateIsComplete(id, false);
                          final snackBar = SnackBar(
                            backgroundColor: Colors.blueAccent,
                            content: Text("${todo.title}を「未実施」にしました。"),
                          );
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TodoDetailPage(todo: todo)
                        ));
                      },
                      title: Text(todo.title),
                      trailing: ActionButtons(todo: todo,),
                    );
                  }
                );
              }
            ),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const TodoCreateEditPage()
            ));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
