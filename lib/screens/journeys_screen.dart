import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev/models/dtos/journey.dart';
import 'package:dev/models/dtos/picture.dart';
import 'package:dev/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
    final borderRadius = BorderRadius.only(
      topRight: Radius.circular(20.0),
      bottomLeft: Radius.circular(20.0),
    );
    return Center(
      child: ListView.builder(
        itemCount: journeys.length,
        itemBuilder: (ctx, i) {
          final item = journeys[i];
          return Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color.fromARGB(30, 27, 33, 24),
                offset: Offset(0.0, 0.31),
              )
            ]),
            child: Card(
              margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: _buildCardContent(item),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildCardContent(Journey item) {
    return Column(
      children: [
        Container(
          height: 180,
          child: Stack(
            children: [
              SizedBox.expand(
                  child: _buildImage(item.pictures.length > 0 ? item.pictures[0] : null)),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black87, Colors.transparent]
                  )
                ),
              )
            ],
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(item.title.fr),
          ),
        )
      ],
    );
  }

  _buildImage(Picture image) {
    if (image == null) {
      return Image.asset("assets/images/placeholder.jpeg", fit: BoxFit.cover,);
    } else {
      return FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: image.src, fit: BoxFit.cover,);
    }
  }
}
