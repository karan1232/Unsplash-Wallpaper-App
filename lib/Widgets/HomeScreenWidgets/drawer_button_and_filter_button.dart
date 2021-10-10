import 'package:flutter/material.dart';
import 'package:wallpaper_app/Widgets/HomeScreenWidgets/card_button.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class DrawerButtonAndFilterButton extends StatelessWidget {
  const DrawerButtonAndFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.02),
        child: Row(
          children: [
            CardButton(iconPath: "assets/icons/menu.png", onPressed: () {}),
            const Spacer(),
            // CardButton(iconPath: "assets/icons/menu.png", onPressed: () {})
          ],
        ));
  }
}
