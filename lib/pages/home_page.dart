import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/bloc/note_bloc.dart';
import 'package:notes/components/note_display.dart';
import 'package:notes/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController noteTitleController;
  late TextEditingController noteContentController;

  void openDialog({NoteModel? note}) {
    noteTitleController = TextEditingController();
    noteContentController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: TextField(
          autofocus: true,
          controller: noteTitleController,
          decoration: InputDecoration(
            hintText: (note != null) ? note.title : "Note Title",
          ),
        ),
        content: TextField(
          maxLines: 5,
          controller: noteContentController,
          decoration: InputDecoration(
            hintText: (note != null) ? note.title : "Note Content",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => submitNote(),
            child: const Text("Add Note"),
          ),
        ],
      ),
    );
  }

  void submitNote() {
    var note = NoteModel(
      id: DateTime.now().toString(),
      title: noteTitleController.text,
      content: noteContentController.text,
      date: DateTime.now(),
    );
    context.read<NoteBloc>().add(AddNote(note: note));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          width: double.infinity,
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'My\nNotes',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => openDialog(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF99b7dd),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      "Add Note",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<NoteBloc, NoteState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.notes.length,
                      itemBuilder: (context, index) {
                        return NoteDisplay(
                          index: index,
                          note: state.notes[index],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
