import 'dart:ui';

import 'package:dev/components/labelled_icon.dart';
import 'package:dev/components/rounded_text_box.dart';
import 'package:dev/models/dtos/journey.dart';
import 'package:dev/models/dtos/picture.dart';
import 'package:dev/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:transparent_image/transparent_image.dart';

class JourneyCard extends StatefulWidget {
  final Journey journey;

  JourneyCard({Key key, this.journey}) : super(key: key);

  @override
  _JourneyCardState createState() => _JourneyCardState();
}

class _JourneyCardState extends State<JourneyCard> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(milliseconds: 75),
      vsync: this,
      lowerBound: 0,
      upperBound: 0.05,
    );
    animation =
        CurvedAnimation(parent: controller, curve: Curves.bounceOut, reverseCurve: Curves.bounceIn)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topRight: Radius.circular(20.0),
      bottomLeft: Radius.circular(20.0),
    );
    return GestureDetector(
      onTapDown: (_) => controller.forward(),
      onTapUp: (_) => controller.reverse(),
      onTap: () => Navigator.of(context).pushNamed('/details', arguments: widget.journey),
      child: Transform.scale(
        scale: 1 - animation.value,
        child: Card(
          margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: _buildCardContent(widget.journey),
          ),
          elevation: 35,
        ),
      ),
    );
    ;
  }

  _buildCardContent(Journey item) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 129,
            child: Stack(
              children: [
                SizedBox.expand(
                    child: _buildImage(item.pictures.length > 0 ? item.pictures[0] : null)),
                SizedBox.expand(child: _buildImageDesc(item))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 26.0, 21.0),
            child: Text(item.title.fr,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: -0.21)),
          ),
          item.sideActivities.length > 0
              ? Padding(
                  padding: EdgeInsets.fromLTRB(20, 0.0, 26, 22),
                  child: _buildActivities(item),
                )
              : Container()
        ],
      ),
    );
  }

  _buildImage(Picture image) {
    if (image == null) {
      return Image.asset(
        "assets/images/placeholder.jpeg",
        fit: BoxFit.cover,
      );
    } else {
      return BlurHash(hash: image.blurhash, image: image.src,);
    }
  }

  _buildImageDesc(Journey item) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black87, Colors.transparent]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RoundedTextBox(
              width: 83,
              height: 28,
              borderRadius: 10,
              boxColor: _getCategoryColor(item.category),
              text: item.category.capitalize(),
            ),
            Row(
              children: [
                LabelledIcon(
                  icon: Icon(Icons.multiple_stop),
                  label: Text(
                    "${(item.length / 1000).floor()} km",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                LabelledIcon(
                  icon: Icon(Icons.watch_later),
                  label: Text(
                    "${(item.duration / 60).floor()} min",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildActivities(Journey item) {
    final background = Color.fromRGBO(71, 180, 255, 0.14);
    return Row(
      children: item.sideActivities
          .map((e) => Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [background, background, Colors.white, Colors.white],
                      stops: [0.0, 0.5, 0.5, 1.0]
                    ),),
                child: Icon(
                  Icons.restaurant,
                  color: Color.fromRGBO(71, 180, 255, 1.0),
                  size: 18,
                ),
              ))
          .toList(),
    );
  }

  _getCategoryColor(String category) {
    switch (category) {
      case "nature":
        return Color.fromARGB(255, 76, 182, 88);
      case "history":
        return Color.fromARGB(255, 255, 196, 38);
      case "water":
        return Color.fromARGB(255, 60, 146, 230);
    }
  }

  _getSideActivityIcon(String activity) {
    switch (activity) {
      case 'restaurant':
        return Icon(
          Icons.restaurant,
          color: Colors.green,
        );
    }
  }
}
