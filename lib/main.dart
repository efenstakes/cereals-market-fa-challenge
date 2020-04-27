import 'package:cema/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cema',
      theme: ThemeData(
        primaryColor: Color(0xffecd3a7),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
