class Img {
  int page;
  int perPage;
  List<Photos> photos;
  int totalResults;
  String nextPage;

  Img({required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage});

  factory Img.fromJson(Map<String, dynamic> jsonMap) {
    List<Photos> photoList = [];
    List<dynamic> tempList = jsonMap["photos"];
    tempList.forEach((element) {
      photoList.add(element);
    });
    return Img(
        page: jsonMap["page"],
        perPage: jsonMap["perPage"],
        photos: photoList,
        totalResults: jsonMap["totalResults"],
        nextPage: jsonMap["nextPage"]);
  }
}

class Photos {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  Src src;
  bool liked;

  Photos({required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked});

  factory Photos.fromJson(Map<String, dynamic> json)
  {
    return Photos(id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographerUrl"],
        photographerId: json["photographerId"],
        avgColor: json["avgColor"],
        src: json["src"],
        liked: json["liked"]);
  }
}

class Src {
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src({required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny});

  factory Src.fromJson(Map<String, dynamic> jsonMap) {
    return Src(
        original: jsonMap["original"],
        large2x: jsonMap["large2x"],
        large: jsonMap["large"],
        medium: jsonMap["medium"],
        small: jsonMap["small"],
        portrait: jsonMap["portrait"],
        landscape: jsonMap["landscape"],
        tiny: jsonMap["tiny"]);
  }
}
