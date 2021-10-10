

String imageBaseApi = "https://api.pexels.com/v1/";

String videoBaseUrl = "https://api.pexels.com/videos/";

String getListOfImage(String page,String per_page)
{
  String api = "curated?page=$page&per_page=$per_page";
  return api;
}

String getFeaturedListOfImages(perPage, page)
{
  String api = "collections/featured?page=$page&per_page=$perPage";
  return api;
}

String getFeaturedCollection(String perPage)
{
  String api = "collections/featured?per_page=$perPage";
  return api;
}

String searchPhoto(String search, String per_page)
{
  String api = "search?query=$search&per_page=$per_page";
  return api;
}

String clientId(accessKey)
{
  String client = "Authorization=$accessKey";
  return client;
}

String getSpecificPhoto(id)
{
  String api = "/photos/$id";
  return api;
}