import 'package:flutter/painting.dart';

const Color kPrimary = Color(0xff202332);
const Color kSecondry = Color(0xffE55459);
const Color kText = Color(0xff727B8C);

Gradient btn = LinearGradient(
  begin: Alignment.topCenter,
  tileMode: TileMode.mirror,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xffF8745C),
    Color(0xFFEE364F),
  ],
);
