import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/router/app_router.dart';
import 'package:notes/presentation/theme/theme_constants.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      theme: ThemeConstants.defaultTheme,
      onGenerateRoute: AppRouter().onGenerateRoute,
      debugShowCheckedModeBanner: false,
    ),
  );
}
