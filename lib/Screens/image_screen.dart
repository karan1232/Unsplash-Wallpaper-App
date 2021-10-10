import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/Models/image_model.dart';
import 'package:wallpaper_app/Widgets/custom_button.dart';
import 'package:wallpaper_app/constants/colors.dart';
import 'package:wallpaper_app/constants/media_query.dart';
import 'package:wallpaper_app/providers/image_provider.dart';

class ImageScreen extends StatefulWidget {
  static const routeName = "/image-screen";

  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageScreenState();
  }
}

class ImageScreenState extends State<ImageScreen> {
  late final Photos currentImage;
  bool isFirstRun = true;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (isFirstRun) {
      currentImage = ModalRoute.of(context)!.settings.arguments as Photos;
      isFirstRun = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageGetterProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              child: SizedBox(
            width: displayWidth(context),
            height: displayHeight(context),
            child: Image.network(
              currentImage.src.portrait,
              fit: BoxFit.cover,
              loadingBuilder: (ctx, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/blur_image.png"),
                          fit: BoxFit.cover)),
                  child: const CupertinoActivityIndicator(),
                );
              },
            ),
          )),
          Positioned(
            left: displayWidth(context) * 0.02,
            top: displayHeight(context) * 0.01,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            left: displayWidth(context) * 0.05,
            bottom: displayHeight(context) * 0.04,
            child: CustomButton(
              buttonHeight: displayHeight(context) * 0.04,
              buttonWidth: displayWidth(context) * 0.06,
              buttonIcon: Icons.favorite,
              buttonName: '',
              isText: false,
              onPress: () {},
            ),
          ),
          Positioned(
            child: CustomButton(
              buttonHeight: displayHeight(context) * 0.04,
              buttonWidth: displayWidth(context) * 0.1,
              buttonIcon: Icons.settings_applications,
              buttonName: 'Apply',
              isText: true,
              onPress: ()async{await imageProvider.applyImageOnHomeScreen(currentImage);},
            ),
            left: displayWidth(context) * 0.2,
            bottom: displayHeight(context) * 0.04,
          ),
          Positioned(
            child: CustomButton(
              buttonHeight: displayHeight(context) * 0.04,
              buttonWidth: displayWidth(context) * 0.06,
              buttonIcon: Icons.download_outlined,
              isText: false,
              buttonName: '',
              onPress: () async {
                await imageProvider.askPermissionAndDownloadImage(
                    currentImage.src.portrait, context, currentImage.id);
              },
            ),
            right: displayWidth(context) * 0.04,
            bottom: displayHeight(context) * 0.04,
          )
        ],
      )),
    );
  }
}
