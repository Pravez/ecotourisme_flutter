import 'package:dev/components/labelled_icon.dart';
import 'package:dev/components/rounded_text_box.dart';
import 'package:dev/models/dtos/journey.dart';
import 'package:dev/models/dtos/picture.dart';
import 'package:flutter/material.dart';
import 'package:dev/utils/extensions.dart';
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
        duration: Duration(milliseconds: 75), vsync: this, lowerBound: 0, upperBound: 0.05, );
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut, reverseCurve: Curves.bounceIn)
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
    return Listener(
      onPointerDown: (_) => controller.forward(),
      onPointerUp: (_) => controller.reverse(),
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
          elevation: 20,
        ),
      ),
    );;
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
              SizedBox.expand(child: _buildImageDesc(item))
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
      return Image.asset(
        "assets/images/placeholder.jpeg",
        fit: BoxFit.cover,
      );
    } else {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: image.src,
        fit: BoxFit.cover,
      );
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
}