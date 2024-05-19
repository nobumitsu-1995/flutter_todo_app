import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String title;
  String detail;
  bool isComplete;
  Timestamp createdAt;
  Timestamp? updatedAt;

  Todo({
    required this.id,
    required this.title,
    required this.detail,
    required this.isComplete,
    required this.createdAt,
    this.updatedAt
  });
}