import 'package:dev/models/dtos/journey.dart';
import 'package:dev/models/dtos/picture.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class JourneyDetailsScreen extends StatelessWidget {
  const JourneyDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final journey = ModalRoute.of(context).settings.arguments as Journey;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 111,
        leadingWidth: 100,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 30, top: 30),
          width: 44,
          height: 44,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(27, 33, 15, 0.14)),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              customBorder: CircleBorder(),
              child: const Icon(Icons.arrow_back, size: 40)),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            height: 362,
            child: _buildImage(journey.pictures[0]),
          )
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
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: image.src,
        fit: BoxFit.cover,
      );
    }
  }
}
