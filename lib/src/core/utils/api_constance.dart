class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String youtubePath(String key) =>
      "https://www.youtube.com/watch?v=$key";

  static const String apiKey = "8b62c46f238dec5717dbd4169229195f";

  /// Movie Constant

  static const String nowPlayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static String popularMoviePath(int page) =>
      "$baseUrl/movie/popular?api_key=$apiKey&page=$page";

  static String topRatedPath(int page) =>
      "$baseUrl/movie/top_rated?api_key=$apiKey&page=$page";

  static String movieDetailPath(int id) =>
      "$baseUrl/movie/$id?api_key=$apiKey&append_to_response=videos,similar,credits";

  static String creditInfoPath(int personId) =>
      "$baseUrl/person/$personId?api_key=$apiKey&append_to_response=movie_credits,tv_credits";

  static const String genresPath = "$baseUrl/genre/movie/list?api_key=$apiKey";

  static String movieByGenres(int genresId, int page) =>
      "$baseUrl/discover/movie?api_key=$apiKey&with_genres=$genresId&page=$page";

  static String searchMoviesPath(String query) =>
      "https://api.themoviedb.org/3/search/movie?api_key=8b62c46f238dec5717dbd4169229195f&query=$query";

  static String imageUrl(String path) => "$baseImageUrl$path";

  ///  Tv constant

  static String popularTvPath(int page) =>
      "$baseUrl/tv/popular?api_key=$apiKey&page=$page";

  static String topRatedTvPath(int page) =>
      "$baseUrl/tv/top_rated?api_key=$apiKey&page=$page";

  static String latestTvPath(int page) =>
      "$baseUrl/tv/latest?api_key=$apiKey&page=$page";

  static String WarTvPath(int page) =>
      "$baseUrl/discover/tv?api_key=$apiKey&page=$page&with_genres=10768";

  static String animationTvPath(int page) =>
      "$baseUrl/discover/tv?api_key=$apiKey&page=$page&with_genres=16";

  static String trendingTvPath(int page) =>
      "$baseUrl/trending/tv/week?api_key=$apiKey&page=$page";

  static String tvDetailPath(int id) =>
      "$baseUrl/tv/$id?api_key=$apiKey&append_to_response=videos,similar,credits";

  static String tvSeasonDetailPath(int tvId, int seasonNumber) =>
      "$baseUrl/tv/$tvId/season/$seasonNumber?api_key=$apiKey";
}
