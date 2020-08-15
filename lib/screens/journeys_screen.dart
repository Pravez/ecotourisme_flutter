import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev/components/labelled_icon.dart';
import 'package:dev/models/dtos/journey.dart';
import 'package:dev/models/dtos/picture.dart';
import 'package:dev/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:dev/utils/extensions.dart';

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
          height: 129,
          child: Stack(
            children: [
              SizedBox.expand(
                  child: _buildImage(item.pictures.length > 0 ? item.pictures[0] : null)),
              SizedBox.expand(
                child: _buildImageDesc(item)
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
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage, image: image.src, fit: BoxFit.cover,);
    }
  }

  _buildImageDesc(Journey item) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black87, Colors.transparent]
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 83,
              height: 28,
              decoration: BoxDecoration(
                color: _getCategoryColor(item.category),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Center(
                child: Text(item.category.capitalize(), style: TextStyle(color: Colors.white),),
              ),
            ),
            Row(
              children: [
                LabelledIcon(
                  icon: Icon(Icons.multiple_stop),
                  label: Text("${(item.length / 1000).floor() } km", style: TextStyle(color: Colors.white),),
                ),
                SizedBox(width: 15,),
                LabelledIcon(
                  icon: Icon(Icons.schedule),
                  label: Text("${(item.duration / 60).floor()} min", style: TextStyle(color: Colors.white),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _getCategoryColor(String category) {
    switch(category) {
      case "nature":
        return Color.fromARGB(255, 76, 182, 88);
      case "history":
        return Color.fromARGB(255, 255, 196, 38);
      case "water":
        return Color.fromARGB(255, 60, 146, 230);
    }
  }
}


