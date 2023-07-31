import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;

  const NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, content, createdAt];

  NoteModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map, {String? id}) {
    return NoteModel(
      id: id ?? map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) {
    return NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
