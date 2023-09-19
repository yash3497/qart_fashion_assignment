import 'package:flutter/material.dart';

SizedBox HeightBox(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox WidthBox(double width) {
  return SizedBox(
    width: width,
  );
}

height(BuildContext context) => MediaQuery.of(context).size.height;
width(BuildContext context) => MediaQuery.of(context).size.width;
