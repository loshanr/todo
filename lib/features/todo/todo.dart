import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String? description;
  final bool completed;
  final Timestamp? createdAt;

  const Todo({
    required this.id,
    required this.title,
    this.description,
    this.completed = false,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, description, completed, createdAt];

  Todo copyWith({
    String? title,
    String? description,
    bool? completed,
    Timestamp? createdAt,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
      // 'createdAt': FieldValue.serverTimestamp(),
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      completed: map['completed'],
      // createdAt: map['createdAt'],
    );
  }
}
