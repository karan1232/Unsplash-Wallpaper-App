import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/Models/image_model.dart';
import 'package:wallpaper_app/constants/apis.dart';
import 'package:wallpaper_app/constants/keys.dart';

class ApiCalls {

  Future getRandomPhotos() async {
    try {
      final response = await http.get(
          Uri.parse(
              imageBaseApi + getListOfImage("1", "15") + clientId(apiKey)),
          headers: {"Authorization": apiKey});
      if (response.statusCode == 200) {
        final extracteData = json.decode(response.body);
        List<dynamic> data = extracteData["photos"];
        List<Photos> fetchedData = [];
        data.forEach((element) {
          fetchedData.add(Photos(
              id: element["id"] ?? 0,
              width: element["width"] ?? 0,
              height: element["height"] ?? 0,
              url: element["url"] ?? "null",
              photographer: element["photographer"] ?? "null",
              photographerUrl: element["photographerUrl"] ?? "null",
              photographerId: element["photographerId"] ?? 0,
              avgColor: element["avgColor"] ?? "null",
              src: Src.fromJson(element["src"]),
              liked: element["liked"] ?? false));
        });
        return fetchedData;
      }
    } on SocketException catch (e) {
      print(e);
      throw "Unable to establish Connection : $e";
    }
  }

  Future searchForPhotos(String search, String per_page)async
  {
    try
        {
          print(  imageBaseApi + getListOfImage("1", "15") + clientId(apiKey));
         var response = await http.get(Uri.parse(imageBaseApi + searchPhoto(search,per_page) + clientId(apiKey)));
         if(response.statusCode < 400)
           {
             print(response.body);
           }
         else
           {
             print(response.statusCode);
             throw "Something went wrong";
           }
        }
        on SocketException catch(e)
    {
      rethrow;
    }
  }

}
