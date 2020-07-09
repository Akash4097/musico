import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomCard extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Widget child;
  final Alignment alignment;
  CustomCard(
      {Key key,
      @required this.child,
      this.alignment,
      this.margin,
      this.padding,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 3.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      child: child,
    );
  }
}