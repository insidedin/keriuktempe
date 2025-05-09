import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keripiktempe/home.dart';
import 'package:keripiktempe/widgets/textview.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  //mengatur waktu splash screen
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textView(EdgeInsets.all(0), 'KruikTempe',
                        TextAlign.left, Colors.green, FontWeight.bold, 20.0),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo-bg.png', width: 200, height: 200),
          ),
          const SizedBox(height: 30),
          Text('by Andini', style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
