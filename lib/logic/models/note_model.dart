import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NoteModel extends Equatable {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt; // this value is also threated as updatedAt, since I forgot to add at the beggining and was too lazy to create another field. My bad tho... 

  @override
  List<Object?> get props => [id, title, content, createdAt];

  const NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map, {String? id}) {
    return NoteModel(
      id: id ?? map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  factory NoteModel.fromJson(String source) {
    return NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  /// will update or save to firebase based on id existence
  void toFirebase(BuildContext context) {
    FirebaseFirestore.instance.collection('notes').doc(id).set(toMap());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Note saved!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void deleteFromFirebase(context) {
    FirebaseFirestore.instance.collection('notes').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Note deleted!'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
