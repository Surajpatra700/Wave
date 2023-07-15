// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wave_chat/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff819ff3),
        //secondaryHeaderColor: Color(0xffb06ab3),
        // b06ab3
      ),
      home: HomeScreen(),
    );
  }
}