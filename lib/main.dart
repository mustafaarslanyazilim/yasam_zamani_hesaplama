import 'package:flutter/material.dart';
import 'package:yasam_zamani_hesaplama/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
      ),
      home: InputPage(),
    );
  }
}
