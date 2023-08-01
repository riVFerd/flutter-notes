import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/logic/models/note_model.dart';
import 'package:notes/presentation/screens/note_detail_screen.dart';
import 'package:notes/presentation/theme/theme_constants.dart';
import 'package:notes/presentation/widgets/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final notesCollection = FirebaseFirestore.instance.collection('notes').orderBy('createdAt', descending: true);

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
                  Text(
                    'My\nNotes',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(NoteDetailScreen.routeName),
                    style: ThemeConstants.roundedButton,
                    child: Text(
                      "Add Note",
                      style: Theme.of(context).textTheme.bodyMedium,
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
                          return NoteCard(
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
