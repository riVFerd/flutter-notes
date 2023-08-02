import 'package:flutter/material.dart';
import 'package:notes/logic/models/note_detail_arguments.dart';
import 'package:notes/presentation/screens/home_screen.dart';
import 'package:notes/presentation/screens/note_detail_screen.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case NoteDetailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) {
            final args = settings.arguments as NoteDetailArguments;
            return NoteDetailScreen(note: args.note, editMode: args.editMode);
          },
        );
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
