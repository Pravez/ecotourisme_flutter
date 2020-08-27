import 'package:flutter/material.dart';

class JourneysScreen extends StatefulWidget {
  JourneysScreen({Key key}) : super(key: key);

  @override
  _JourneysScreenState createState() => _JourneysScreenState();
}

class _JourneysScreenState extends State<JourneysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Salut ! Merci de participer à ce dojo 👍"),
      ),
    );
  }
}