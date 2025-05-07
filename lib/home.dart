import 'package:flutter/material.dart';
import 'package:keripiktempe/widgets/textview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //konten header
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    child: textView(
                        EdgeInsets.all(0),
                        'User! Selamat Datang di',
                        TextAlign.left,
                        Colors.black,
                        FontWeight.normal,
                        15.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: textView(EdgeInsets.all(0), 'KruikTempe',
                        TextAlign.left, Colors.green, FontWeight.bold, 20.0),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.menu_rounded)),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
