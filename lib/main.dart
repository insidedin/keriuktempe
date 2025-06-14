import 'package:flutter/material.dart';
import 'package:keripiktempe/home.dart';
import 'package:keripiktempe/homewava.dart';
import 'package:keripiktempe/splashscreen.dart';

void main() {
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
