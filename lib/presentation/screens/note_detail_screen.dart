import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/logic/models/note_detail_arguments.dart';
import 'package:notes/logic/models/note_model.dart';

class NoteDetailScreen extends StatelessWidget {
  NoteDetailScreen({super.key, this.note, this.editMode = false})
      : titleController = TextEditingController(text: note?.title),
        contentController = TextEditingController(text: note?.content);

  static const routeName = '/note_detail';
  final NoteModel? note;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final bool editMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: const BoxDecoration(color: Colors.black),
          child: (editMode) ? addNote(context) : displayNote(context),
        ),
      ),
    );
  }

  Column addNote(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: 'Title',
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: contentController,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Content',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            NoteModel newNote = NoteModel(
              id: note?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
              title: titleController.text,
              content: contentController.text,
              createdAt: DateTime.now(),
            );
            newNote.toFirebase();
            Navigator.of(context).pushReplacementNamed(
              NoteDetailScreen.routeName,
              arguments: NoteDetailArguemnts(note: newNote),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Note saved!'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: Text('${note == null ? "Add" : "Edit"} Note'),
        ),
      ],
    );
  }

  Column displayNote(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note!.title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            DateFormat('yyyy-MM-dd HH:mm:ss').format(note!.createdAt),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          note!.content,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  NoteDetailScreen.routeName,
                  arguments: NoteDetailArguemnts(
                    note: note,
                    editMode: true,
                  ),
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                note!.deleteFromFirebase();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Note deleted!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
    );
  }
}
