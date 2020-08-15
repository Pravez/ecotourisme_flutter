import 'package:flutter/material.dart';

class RoundedTextBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String text;
  final Color boxColor;
  final Color textColor;

  const RoundedTextBox(
      {Key key, this.width, this.height, this.borderRadius, this.text, this.boxColor, this.textColor = Colors
          .white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
