import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/Screens/search_screen.dart';
import 'package:wallpaper_app/constants/colors.dart';
import 'package:wallpaper_app/constants/media_query.dart';
import 'package:wallpaper_app/providers/image_provider.dart';

class SearchBar extends StatelessWidget {
  SearchBar(this.searchKey, {Key? key}) : super(key: key);

  final searchKey;
  late String searchedValue;

  @override
  Widget build(BuildContext context) {

    final imageProvider = Provider.of<ImageGetterProvider>(context);

    final borderDesign = OutlineInputBorder(
        borderRadius: BorderRadius.circular(displayHeight(context) * 0.02),
        borderSide: const BorderSide(color: white));

    return Container(
        margin: EdgeInsets.only(
            left: displayWidth(context) * 0.05,
            right: displayWidth(context) * 0.05,
            top: displayHeight(context) * 0.02),
        child: Form(
            key: searchKey,
            child: TextFormField(
                onSaved: (value) {
                  searchedValue = value!;
                },
                onFieldSubmitted: (value) {
                  if (searchKey.currentState!.validate()) {
                    searchKey.currentState!.save();
                    if (searchedValue.isNotEmpty || searchedValue != "") {
                      Navigator.of(context).pushNamed(SearchScreen.routeName);
                      imageProvider.searchedPics(context,searchedValue,"30");
                    }
                  }
                },
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: black,
                    ),
                    hintText: "Search for free wallpapers",
                    focusedBorder: borderDesign,
                    fillColor: white,
                    filled: true,
                    enabled: true,
                    enabledBorder: borderDesign,
                    border: borderDesign))));
  }
}
