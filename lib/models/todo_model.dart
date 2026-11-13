import'package:cloud_firestore/cloud_firestore.dart';
class TodoModel {
  final String id;
  final String title;
  final bool isDone;
  final String userId;
  final DateTime? dueDate;

  TodoModel({
    required this.id,
    required this.title,
    required this.isDone,
    required this.userId,
    this.dueDate,
  });

  Map<String,dynamic> toMap(){  //obj to json
    return{
      'title' : title,
      'isDone' : isDone,
      'userId' : userId,
      'dueDate' : dueDate != null ? Timestamp.fromDate(dueDate!) : null,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map, String documentId){  //json to obj
    return TodoModel(id: documentId,
    title: map['title'] ?? '',
    isDone: map['isDone'] ?? false,
    userId: map['userId'] ?? '',
    dueDate: map['dueDate'] != null
       ? (map['dueDate'] as Timestamp).toDate()
       : null,
    );
  }
}