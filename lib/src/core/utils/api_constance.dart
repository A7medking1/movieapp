class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "8b62c46f238dec5717dbd4169229195f";

  static const String nowPlayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviePath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailPath(int id) =>
      "$baseUrl/movie/$id?api_key=$apiKey";

  static String recommendationsPath(int id) =>
      "$baseUrl/movie/$id/recommendations?api_key=$apiKey";

  static String creditsPath(int id) =>
      "$baseUrl/movie/$id/credits?api_key=$apiKey";


  static String videoPath(int id) =>
      "$baseUrl//movie/$id/videos?api_key=$apiKey";

  static String youtubePath(String key) =>
      "https://www.youtube.com/watch?v=$key";


  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static  String imageUrl(String path) => "$baseImageUrl$path";

}
