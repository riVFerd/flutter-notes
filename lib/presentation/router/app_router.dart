import 'package:flutter/material.dart';
import 'package:notes/logic/models/note_model.dart';
import 'package:notes/presentation/screens/home_screen.dart';
import 'package:notes/presentation/screens/note_detail_screen.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName :
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case NoteDetailScreen.routeName :
        final note = settings.arguments as NoteModel;
        return MaterialPageRoute(builder: (_) => NoteDetailScreen(note: note));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}