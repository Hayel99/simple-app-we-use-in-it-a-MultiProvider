import 'package:flutter/material.dart';
import 'package:four/screens/home.dart';

void main() {
  runApp(
  MaterialApp(
    home:MyApp(),
    debugShowCheckedModeBanner: false,
  )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}