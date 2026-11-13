import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_flutter_app/models/todo_model.dart';

class DatabaseService {
  final String? uid;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService({this.uid});

  CollectionReference get todosCollection{
    return _db.collection('todoApp').doc(uid).collection('todos');
  }

  // Create a TODO
  Future<void> addTodo(String title, DateTime ? dueDate) async {
    if(uid == null ) return;
    await todosCollection.add({
      'title' : title,
      'isDone' : false,
      'userId' : uid,
      'createAt' : FieldValue.serverTimestamp(),
      'dueDate' : dueDate != null ? Timestamp.fromDate(dueDate) : null,

    });
  }

  //UPDATE TODO STATUS: either completed or not done
  Future<void> updateTodoStatus(String id,bool isDone) async {
    await todosCollection.doc(id).update({'isDone' : isDone});
  }

  //EDIT A TODO
  Future<void> updateTodo(String id,String title,DateTime? dueDate) async{
    await todosCollection.doc(id).update({
      'title' : title,
      'dueDate' : dueDate != null ? Timestamp.fromDate(dueDate) : null,
    });
  }

  //DELETE A TODO
  Future<void> deleteTodo(String id) async{
    await todosCollection.doc(id).delete();
  }

  //READ ALL TODOS
  Stream<List<TodoModel>> get todos{
    if(uid == null) {
      return Stream.value([]);
    }
    return todosCollection
         .orderBy('createdAt', descending: true)
         .snapshots()
         .map(_todoListFromSnapshot);
  }

  List<TodoModel> _todoListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return TodoModel.fromMap(doc.data() as Map<String, dynamic> , doc.id);
  }).toList();
  }
  
}