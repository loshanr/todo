import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/features/todo/todo.dart';

class TodoRepository {
  static final TodoRepository instance = TodoRepository._();
  late final FirebaseFirestore _firestore;

  factory TodoRepository() {
    return instance;
  }

  TodoRepository._() : _firestore = FirebaseFirestore.instance;

  Future<void> addTodo(Todo todo) async {
    await _firestore.collection('todos').add(todo.toMap());
  }

  Future<void> updateTodo(Todo todo) async {
    await _firestore.collection('todos').doc(todo.id).update(todo.toMap());
  }

  Future<void> deleteTodo(Todo todo) async {
    await _firestore.collection('todos').doc(todo.id).delete();
  }

  Stream<List<Todo>> getTodos() {
    return _firestore
        .collection('todos')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Todo.fromMap(doc.data())).toList());
  }
}
