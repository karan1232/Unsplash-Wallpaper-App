import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/media_query.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search-screen";

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.only(
                top: displayHeight(context) * 0.03,
                right: displayWidth(context) * 0.02,
                left: displayWidth(context) * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nature",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: displayHeight(context) * 0.06),
                ),
                Text(
                  "36 wallpaper available",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffACB4BA),
                      fontSize: displayHeight(context) * 0.025),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                SizedBox(
                    height: displayHeight(context) * 0.75,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: displayHeight(context) * 0.3,
                            crossAxisCount: 2,
                            crossAxisSpacing: displayWidth(context) * 0.02,
                            mainAxisSpacing: displayHeight(context) * 0.03),
                        itemBuilder: (ctx, index) => ClipRRect(
                              child: Image.network(""),
                              borderRadius: BorderRadius.circular(
                                  displayHeight(context) * 0.02),
                            )))
              ],
            )),
      ),
    );
  }
}
