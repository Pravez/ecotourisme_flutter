import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev/models/dtos/journey.dart';
import 'package:dev/models/dtos/picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class JourneyDetailsScreen extends StatefulWidget {
  const JourneyDetailsScreen({Key key}) : super(key: key);

  @override
  _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
}

class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
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
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Color.fromRGBO(27, 33, 15, 0.14)),
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
            child: _buildCarousel(journey.pictures),
          )
        ],
      ),
    );
  }

  _buildCarousel(List<Picture> pictures) {
    if (pictures.isEmpty) {
      return Image.asset(
        "assets/images/placeholder.jpeg",
        fit: BoxFit.cover,
      );
    }
    return CarouselSlider(
      options: CarouselOptions(
          initialPage: 0,
          enableInfiniteScroll: true,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
        height: 362
      ),
      items: pictures
          .map((e) => Builder(
              builder: (ctx) => BlurHash(
                    hash: e.blurhash,
                    image: e.src,
                    imageFit: BoxFit.cover,
                  )))
          .toList(),
    );
  }
}
