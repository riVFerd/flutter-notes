import 'package:flutter/material.dart';
import 'package:notes/components/note_display.dart';
import 'package:notes/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of notes (cange to get from database later)
  List<NoteModel> notes = [
    NoteModel(
        id: "1",
        title: "Note1",
        content: "Content1 aldkfjal adsfja lasdkjfl lasdjf ladfj aldskjf",
        date: DateTime.now()),
    NoteModel(
        id: "2", title: "Note2", content: "Content2", date: DateTime.now()),
    NoteModel(
        id: "3", title: "Note3", content: "Content3", date: DateTime.now()),
    NoteModel(
        id: "4", title: "Note4", content: "Content4", date: DateTime.now()),
    NoteModel(
        id: "5", title: "Note5", content: "Content5", date: DateTime.now()),
    NoteModel(
        id: "6", title: "Note6", content: "Content6", date: DateTime.now()),
    NoteModel(
        id: "7", title: "Note7", content: "Content7", date: DateTime.now()),
    NoteModel(
        id: "8", title: "Note8", content: "Content8", date: DateTime.now()),
    NoteModel(
        id: "9", title: "Note9", content: "Content9", date: DateTime.now()),
    NoteModel(
        id: "10", title: "Note10", content: "Content10", date: DateTime.now()),
  ];

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
              const Text(
                'My\nNotes',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NoteDisplay(
                      index: index,
                      notes: notes,
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
