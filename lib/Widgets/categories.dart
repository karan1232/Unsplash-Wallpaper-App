import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class CategoriesTile extends StatelessWidget {
  final String imgUrls, categorie;

  const CategoriesTile({required this.imgUrls, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: displayWidth(context) * 0.02),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius:
                    BorderRadius.circular(displayHeight(context) * 0.01),
                child: Image.network(
                  imgUrls,
                  height: displayHeight(context) * 0.1,
                  width: displayWidth(context) * 0.15,
                  fit: BoxFit.cover,
                )),
            Container(
              height: displayHeight(context) * 0.1,
              width: displayWidth(context) * 0.15,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius:
                    BorderRadius.circular(displayHeight(context) * 0.01),
              ),
            ),
            Container(
                height: displayHeight(context) * 0.1,
                width: displayWidth(context) * 0.15,
                alignment: Alignment.center,
                child: Text(
                  categorie,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: displayHeight(context) * 0.02,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Overpass'),
                ))
          ],
        ),
      ),
    );
  }
}
