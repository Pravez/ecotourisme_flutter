import 'package:flutter/material.dart';

class LabelledIcon extends StatelessWidget {
  final Icon icon;
  final Text label;

  final Color color;

  const LabelledIcon({Key key, this.icon, this.label, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(color: color),
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 8.0),
          label
        ],
      ),
    );
  }
}
