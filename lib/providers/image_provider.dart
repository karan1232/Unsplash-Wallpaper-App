import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_app/ApiCalls/api_calls.dart';
import 'package:wallpaper_app/Models/category.dart';
import 'package:wallpaper_app/Models/image_model.dart';
import 'package:permission_asker/permission_asker.dart' as pa;
import 'package:http/http.dart' as http;

class ImageGetterProvider with ChangeNotifier {
  final apiCalls = ApiCalls();

  List<Photos> randomPhotos = [];

  Future getRandomPhotos(context) async {
    try {
      final response = await apiCalls.getRandomPhotos();
      randomPhotos = response;
      notifyListeners();
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  askPermissionAndDownloadImage(url, context, id) async {
    if (Platform.isAndroid) {
      if (await pa.Permission.storage.status.isGranted) {
        saveImage(url, context, id);
      } else {
        await pa.Permission.storage.request();
        if (await pa.Permission.storage.status.isGranted) {
          saveImage(url, context, id);
        }
      }
    }
  }

  Future saveImage(url, context, id) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode < 400) {
        Directory directory = await getApplicationDocumentsDirectory();
        File imgFile = File(directory.path + "/$id.jpeg");
        print(imgFile.path + id.toString());
        imgFile.writeAsBytesSync(response.bodyBytes);
      }
    } on SocketException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  applyImageOnHomeScreen(currentImage) async {
    var progress =
        await Wallpaper.ImageDownloadProgress(currentImage.src.portrait);
    progress.listen((event) {}, onDone: () async {
      await Wallpaper.homeScreen();
    });
  }

  List<Category> categories = [
    Category(
        categoryName: "Street Art",
        imgUrl:
            "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        categoryName: "Wild Life",
        imgUrl:
            "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        categoryName: "Nature",
        imgUrl:
            "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        categoryName: "City",
        imgUrl:
            "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
    Category(
        categoryName: "Motivation",
        imgUrl:
            "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        categoryName: "Bikes",
        imgUrl:
            "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        categoryName: "Cars",
        imgUrl:
            "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
  ];

  Future searchedPics(context, String search, String per_page) async {
    try {
      final response = await apiCalls.searchForPhotos(search, per_page);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
