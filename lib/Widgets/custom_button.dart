import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/colors.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class CustomButton extends StatelessWidget {
    CustomButton(
      {Key? key,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.buttonIcon,
      required this.isText,
      required this.buttonName,required this.onPress})
      : super(key: key);

  final double buttonHeight;
  final double buttonWidth;
  final IconData buttonIcon;
  final bool isText;
  final String buttonName;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {onPress();},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                displayHeight(context) * 0.01,
              ),
              color: gray95),
          height: buttonHeight,
          width: buttonWidth,
          child: Center(
            child: isText ? Text(buttonName) : Icon(buttonIcon),
          ),
        ));
  }
}
