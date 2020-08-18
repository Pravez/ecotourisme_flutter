import 'package:flutter/cupertino.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension SizeExtension<T extends num> on T {
  static final designSize = [Size(414, 896), Size(896, 414)];

  int _orientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape ? 1 : 0;
  }

  T adaptWidth(BuildContext context) {
    return (this * MediaQuery.of(context).size.width / designSize[_orientation(context)].width) as T;
  }

  T adaptHeight(BuildContext context) {
    return (this * MediaQuery.of(context).size.height / designSize[_orientation(context)].height) as T;
  }

  T hh(BuildContext context) {
    return this.adaptHeight(context);
  }

  T ww(BuildContext context) {
    return this.adaptWidth(context);
  }
}