import 'package:flutter/material.dart';
import 'package:notes/logic/models/note_model.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({super.key,required this.note});

  static const routeName = '/note_detail';
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Text(note.title),
          ],
        ),
      ),
    );
  }
}
