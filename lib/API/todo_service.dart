
import 'package:flutter_todo_app/API/todo_collection.dart';

Future<void> deleteTodo(String id) async {
  final doc = todoCollection.doc(id);
  await doc.delete();
}

