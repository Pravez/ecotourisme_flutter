import 'package:dev/models/dtos/journey.dart';
import 'package:flutter/material.dart';

class JourneyDetailsScreen extends StatelessWidget {
  const JourneyDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final journey = ModalRoute.of(context).settings.arguments as Journey;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          customBorder: CircleBorder(),
          child: Container(
            margin: EdgeInsets.only(left: 30, top: 30),
            width: 44,
            height: 44,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(27, 33, 15, 0.14)),
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(color: Colors.blue, height: 400, child: Text(journey.title.fr)),
    );
  }
}
