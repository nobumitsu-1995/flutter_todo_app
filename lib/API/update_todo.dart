import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/API/todo_collection.dart';

Future<void> updateTodo(String id, String title, String detail) async {
  await todoCollection.doc(id).update({
    'title': title,
    'detail': detail,
    'updatedAt': Timestamp.now()
  });
}