import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev/models/dtos/journey.dart';
import 'package:dev/screens/journey/journey_card.dart';
import 'package:dev/services/firestore_service.dart';
import 'package:flutter/material.dart';

class JourneysScreen extends StatefulWidget {
  JourneysScreen({Key key}) : super(key: key);

  @override
  _JourneysScreenState createState() => _JourneysScreenState();
}

class _JourneysScreenState extends State<JourneysScreen> {
  final firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Journey>>(
      future: FirestoreService.getJourneys(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return _build(snapshot.data);
        } else if (snapshot.hasError) {
          return Center(
            child: Text("An error occured !"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _build(List<Journey> journeys) {
    return Center(
      child: ListView.builder(
        itemCount: journeys.length,
        itemBuilder: (ctx, i) => JourneyCard(journey: journeys[i]),
      ),
    );
  }
}
