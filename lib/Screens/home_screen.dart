import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/Widgets/HomeScreenWidgets/category_text_and_button.dart';
import 'package:wallpaper_app/Widgets/HomeScreenWidgets/center_title.dart';
import 'package:wallpaper_app/Widgets/HomeScreenWidgets/drawer_button_and_filter_button.dart';
import 'package:wallpaper_app/Widgets/HomeScreenWidgets/list_of_categories.dart';
import 'package:wallpaper_app/Widgets/HomeScreenWidgets/list_of_images.dart';
import 'package:wallpaper_app/Widgets/HomeScreenWidgets/search_bar.dart';
import 'package:wallpaper_app/constants/media_query.dart';
import 'package:wallpaper_app/providers/image_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  bool isFirstRun = true;

  final searchFormKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (isFirstRun) {
      final imageProvider =
          Provider.of<ImageGetterProvider>(context, listen: false);
      await imageProvider.getRandomPhotos(context);
      isFirstRun = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageGetterProvider>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Container(
              height: displayHeight(context),
              width: displayWidth(context),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/wall_graffiti.jpg"),
                      alignment: Alignment.topLeft)),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  const DrawerButtonAndFilterButton(),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  CenterTitle(
                      title: "Looking for high quality free wallpapers?"),
                   SearchBar(searchFormKey),
                  Container(
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(displayHeight(context) * 0.04),
                            topRight: Radius.circular(
                                displayHeight(context) * 0.04))),
                    child: Container(
                        margin: EdgeInsets.only(
                          top: displayHeight(context) * 0.05,
                          left: displayWidth(context) * 0.03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wallpapers",
                              style: TextStyle(
                                  fontSize: displayHeight(context) * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            const CategoryTextAndButton(isButtonNeeded: true,
                              category: 'Popular now',
                            ),
                            ListOfImages(
                              receivedImageList: imageProvider.randomPhotos,
                            ),
                            const CategoryTextAndButton(isButtonNeeded: false,
                              category: 'Categories',
                            ),
                            const ListOfCategories(),
                            SizedBox(
                              height: displayHeight(context) * 0.04,
                            )
                          ],
                        )),
                  )
                ],
              ))),
        ));
  }
}
