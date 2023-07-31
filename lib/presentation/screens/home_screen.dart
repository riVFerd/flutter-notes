import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/widgets/note_display.dart';
import 'package:notes/logic/models/note_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: move the new notes dialog to a separate widget
    final notesCollection = FirebaseFirestore.instance.collection('notes');
    
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
                    onPressed: () => {},
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
                child: StreamBuilder(
                  stream: notesCollection.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final document = snapshot.data!.docs[index];
                          return NoteDisplay(
                            index: index,
                            note: NoteModel.fromMap(
                              id: document.id,
                              document.data(),
                            ),
                          );
                        },
                      );
                    }
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
