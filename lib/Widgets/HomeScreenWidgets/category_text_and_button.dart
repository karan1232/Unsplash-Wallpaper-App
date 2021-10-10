import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class CategoryTextAndButton extends StatelessWidget {
  const CategoryTextAndButton(
      {Key? key, required this.category, required this.isButtonNeeded})
      : super(key: key);

  final String category;
  final bool isButtonNeeded;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        category,
        style: TextStyle(
            height: displayHeight(context) * 0.005,
            fontWeight: FontWeight.w700,
            fontSize: displayHeight(context) * 0.02),
      ),
      const Spacer(),
      isButtonNeeded
          ? InkWell(
              child: Padding(
                  padding:
                      EdgeInsets.only(right: displayHeight(context) * 0.04),
                  child: Text(
                    "More",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      height: displayHeight(context) * 0.005,
                    ),
                  )),
              onTap: () {},
            )
          : Container()
    ]);
  }
}
