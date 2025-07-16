
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keripiktempe/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:FirebaseOptions(
      apiKey: "AIzaSyDlI6tWddZUOwswZ7w4I8sCgqF2GzFaNMM",
      authDomain: "keriuk-tempe.firebaseapp.com",
      projectId: "keriuk-tempe",
      storageBucket: "keriuk-tempe.firebasestorage.app",
      messagingSenderId: "806708669912",
      appId: "1:806708669912:web:661f77de9842ac832dd6ad"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
