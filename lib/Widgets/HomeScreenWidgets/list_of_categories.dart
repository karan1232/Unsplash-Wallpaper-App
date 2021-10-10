import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/constants/media_query.dart';
import 'package:wallpaper_app/providers/image_provider.dart';

import '../categories.dart';

class ListOfCategories extends StatelessWidget {
  const ListOfCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageGetterProvider>(context);

    return SizedBox(
      height: displayHeight(context) * 0.1,
      child: ListView.builder(
          itemCount: imageProvider.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesTile(
              imgUrls: imageProvider.categories[index].imgUrl,
              categorie: imageProvider.categories[index].categoryName,
            );
          }),
    );
  }
}
