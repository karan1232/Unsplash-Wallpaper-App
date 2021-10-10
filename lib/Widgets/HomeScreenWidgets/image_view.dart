import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/Models/image_model.dart';
import 'package:wallpaper_app/Screens/image_screen.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.currentImage}) : super(key: key);

  final Photos currentImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) * 0.23,
      width: displayWidth(context) * 0.17,
      child: Card(
          elevation: 3,
          child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(displayHeight(context) * 0.01),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(ImageScreen.routeName,
                      arguments: currentImage);
                  // Navigator.of(context).pushNamed(TestScreen.routeName,arguments: currentImage.id);
                },
                child: Image.network(
                  currentImage.src.small,
                  fit: BoxFit.cover,
                  loadingBuilder: (ctx, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              displayHeight(context) * 0.01),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/blur_image.png"),
                              fit: BoxFit.cover)),
                      child: const CupertinoActivityIndicator(),
                    );
                  },
                ),
              ))),
    );
  }
}
