import 'package:flutter/material.dart';
import 'package:real_estate_app/ui/screen/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
