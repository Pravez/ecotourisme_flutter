import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev/components/labelled_icon.dart';
import 'package:dev/components/rounded_text_box.dart';
import 'package:dev/models/dtos/journey.dart';
import 'package:dev/models/dtos/picture.dart';
import 'package:dev/screens/journey/detail/journey_info_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dev/utils/extensions.dart';

class JourneyDetailsScreen extends StatefulWidget {
  const JourneyDetailsScreen({Key key}) : super(key: key);

  @override
  _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
}

class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
  @override
  Widget build(BuildContext ctx) {
    final journey = ModalRoute.of(ctx).settings.arguments as Journey;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 111.0.hh(ctx),
        leadingWidth: 100.0.ww(ctx),
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 30.0.ww(ctx), top: 30.0.hh(ctx)),
          width: 44.0.ww(ctx),
          height: 44.0.hh(ctx),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Color.fromRGBO(27, 33, 15, 0.14)),
          child: InkWell(
              onTap: () => Navigator.of(ctx).pop(),
              customBorder: CircleBorder(),
              child: const Icon(Icons.arrow_back, size: 40)),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: 362.0.hh(ctx),
                child: _buildCarousel(journey.pictures),
              ),
              _buildDescription(journey)
            ],
          ),
          ..._buildButtonAndCategory(journey)
        ]),
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
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          height: 362.0.hh(context)),
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

  List<Widget> _buildButtonAndCategory(Journey journey) {
    final ctx = context;
    return [
      Positioned(
        left: 229.0.ww(ctx),
        top: 142.0.hh(ctx),
        height: 436.0.hh(ctx),
        width: 185.0.ww(ctx),
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/pointill.svg",
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  82.0.ww(ctx), 182.0.hh(ctx), 43.0.ww(ctx), 194.0.hh(ctx)),
              child: RaisedButton(
                shape: CircleBorder(),
                child: Center(
                  child: Icon(
                    Icons.share,
                    color: Color(0xFFffc426),
                    size: 24,
                  ),
                ),
                onPressed: () {},
                elevation: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      Positioned(
        left: 30.0.ww(ctx),
        top: 348.0.hh(ctx) - 5,
        child: RoundedTextBox(
          width: 94.0.ww(ctx),
          height: 31,
          borderRadius: 10.0,
          text: journey.category.capitalize(),
          boxColor: _getCategoryColor(journey.category),
        ),
      )
    ];
  }

  _buildDescription(Journey journey) {
    final ctx = context;
    final color = _getCategoryColor(journey.category);
    return Padding(
      padding: EdgeInsets.only(
          left: 34.0.ww(ctx), top: 42.0.hh(ctx), right: 30.0.ww(ctx)),
      child: Column(
        children: [
          Row(
            children: [
              LabelledIcon(
                icon: Icon(Icons.multiple_stop, color: color),
                label: Text(
                  "${(journey.length / 1000).floor()} km",
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              LabelledIcon(
                icon: Icon(
                  Icons.watch_later,
                  color: color,
                ),
                label: Text(
                  "${(journey.duration / 60).floor()} min",
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(journey.title.fr,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.38,
                    color: Color(0xFF4b4b4b))),
          ),
          JourneyInfoTabs(journey: journey)
        ],
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
