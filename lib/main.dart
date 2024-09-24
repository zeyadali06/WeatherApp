import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tennis_app/Core/Utils/DependencyInjection.dart';
import 'package:tennis_app/firebase_options.dart';
import 'package:tennis_app/Core/Utils/AppRouter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: AppRouter.splashView,
    );
  }
}
