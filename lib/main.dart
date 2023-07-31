import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/logic/bloc/notes_bloc.dart';
import 'package:notes/presentation/router/app_router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NoteBloc()..add(LoadNote())),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter().onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
