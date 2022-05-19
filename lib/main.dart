import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BePo',
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 32, 147, 204)),
      home: const HomePage(),
    );
  }
}
