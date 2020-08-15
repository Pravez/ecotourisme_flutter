import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topRight: Radius.circular(20.0),
      bottomLeft: Radius.circular(20.0),
    );
    return Card(
      margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          height: 243,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  EmptyContainer(
                    height: 84,
                    radius: 9,
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmptyContainer(
                        height: 15,
                        radius: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FractionallySizedBox(
                          widthFactor: 0.5,
                          child: EmptyContainer(
                            height: 15,
                            radius: 2,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      EmptyContainer(
                        height: 40,
                        width: 40,
                        radius: 6,
                      ),
                      EmptyContainer(
                        height: 40,
                        width: 40,
                        radius: 6,
                        margin: EdgeInsets.only(left: 15),
                      ),
                      EmptyContainer(
                        height: 40,
                        width: 40,
                        radius: 6,
                        margin: EdgeInsets.only(left: 15),
                      ),
                      EmptyContainer(
                        height: 40,
                        width: 40,
                        radius: 6,
                        margin: EdgeInsets.only(left: 15),
                      ),
                      EmptyContainer(
                        height: 40,
                        width: 40,
                        radius: 6,
                        margin: EdgeInsets.only(left: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      elevation: 20,
    );
  }
}

class EmptyContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final Color color;
  final EdgeInsets margin;

  const EmptyContainer(
      {Key key,
      this.height,
      this.radius,
      this.color = Colors.white,
      this.width = double.infinity,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(radius)), color: color),
      height: height,
      width: width,
    );
  }
}
