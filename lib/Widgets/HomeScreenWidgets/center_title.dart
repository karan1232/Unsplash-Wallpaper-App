import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/colors.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class CenterTitle extends StatelessWidget {
   CenterTitle({Key? key,required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: white,
          fontSize: displayHeight(context) * 0.04),
      textAlign: TextAlign.center,
    );
  }
}
