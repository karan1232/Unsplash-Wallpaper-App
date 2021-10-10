import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/colors.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class CardButton extends StatelessWidget {
  const CardButton({Key? key, required this.iconPath, required this.onPressed}) : super(key: key);

  final String iconPath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(displayHeight(context) * 0.02)),
        child: IconButton(
          icon: Image.asset(
            "assets/icons/menu.png",
            color: black,
          ),
          onPressed: () {},
        ));
  }
}
