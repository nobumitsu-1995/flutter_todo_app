import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/API/todo_collection.dart';

Future<void> createTodo(String title, String detail) async {
  await todoCollection.add({
    'title': title,
    'detail': detail,
    'isComplete': false,
    'createdAt': Timestamp.now()
  });
}