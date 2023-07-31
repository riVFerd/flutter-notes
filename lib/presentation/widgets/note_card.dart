import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/logic/models/note_model.dart';
import 'package:notes/presentation/screens/note_detail_screen.dart';
import 'package:notes/presentation/theme/theme_constants.dart';

class NoteCard extends StatelessWidget {
  final int index;
  final NoteModel note;

  const NoteCard({
    super.key,
    required this.index,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        NoteDetailScreen.routeName,
        arguments: note,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 100,
        decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? const Color(0xFFf7d44c)
              : const Color(0xFFea7a53),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: ThemeConstants.elipsedText.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    note.content,
                    style: ThemeConstants.elipsedText.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              DateFormat.yMd().format(note.createdAt),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
