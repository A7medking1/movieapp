class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "8b62c46f238dec5717dbd4169229195f";

  static const String nowPlayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviePath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";



}
