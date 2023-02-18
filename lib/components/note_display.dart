import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:intl/intl.dart';

class NoteDisplay extends StatelessWidget {
  final int index;
  final List<NoteModel> notes;
  const NoteDisplay({
    super.key,
    required this.index,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  notes[index].title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  notes[index].content,
                  style: const TextStyle(
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Text(
            DateFormat.yMd().format(notes[index].date),
          ),
        ],
      ),
    );
  }
}
