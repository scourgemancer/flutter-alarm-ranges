import 'package:flutter/material.dart';
import 'src/widgets/my_home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Alarm Ranges',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: new MyHomePage(title: 'Alarm Ranges'),
    );
  }
}