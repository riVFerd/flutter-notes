import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/logic/models/note_model.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key, this.note});

  static const routeName = '/note_detail';
  final NoteModel? note;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _editMode = false;

  @override
  Widget build(BuildContext context) {
    if (widget.note == null) _editMode = true;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: const BoxDecoration(color: Colors.black),
          child:
              (_editMode) ? addNote(context) : displayNote(context),
        ),
      ),
    );
  }

  Column addNote(BuildContext context) {
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            hintText: 'Title',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _contentController,
          decoration: const InputDecoration(
            hintText: 'Content',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add Note'),
        ),
      ],
    );
  }

  Column displayNote(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.note!.title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 8),
        Text(
          DateFormat('yyyy-MM-dd HH:mm:ss').format(widget.note!.createdAt),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          widget.note!.content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => setState(() => _editMode = true),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
    );
  }
}
