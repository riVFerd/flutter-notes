import 'dart:convert';

import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String id;
  final String title;
  final String content;
  final DateTime date;

  const NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  List<Object?> get props => [id, title, content, date];

  NoteModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? date,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));
}
