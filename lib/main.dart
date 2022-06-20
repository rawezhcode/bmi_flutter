import 'package:bmi/home.dart';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color(0xFF04040C),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          headline4: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1EE777),
          ),
          headline3: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          headline1: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white24,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
