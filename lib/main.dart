import 'package:flutter/material.dart';
import 'screens/journeys_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dojo Ecotourisme !',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JourneysScreen(),
    );
  }
}