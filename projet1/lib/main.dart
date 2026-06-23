import 'package:flutter/material.dart';
import 'package:projet1/pages/auth/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Opportunités Mali',

      home: const Home(),
    );
  }
}
