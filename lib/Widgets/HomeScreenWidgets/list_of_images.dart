import 'package:flutter/material.dart';
import 'package:wallpaper_app/Models/image_model.dart';
import 'package:wallpaper_app/constants/media_query.dart';

import 'image_view.dart';

class ListOfImages extends StatelessWidget {
  const ListOfImages({Key? key, required this.receivedImageList}) : super(key: key);

  final List<Photos> receivedImageList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: displayHeight(context) * 0.23,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: receivedImageList.length,
            itemBuilder: (ctx, index) => Row(children: [
                  ImageView(currentImage: receivedImageList[index]),
                  SizedBox(
                    width: displayWidth(context) * 0.02,
                  )
                ])));
  }
}
