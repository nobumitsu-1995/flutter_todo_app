

import 'package:flutter_todo_app/API/todo_collection.dart';

Future<void> updateIsComplete(String id, bool isComplete) async {
  await todoCollection.doc(id).update({
    'isComplete': isComplete
  });
}