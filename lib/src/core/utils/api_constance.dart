import 'package:movieapp/src/core/utils/enums.dart';

class ApiConstance {
  static const String _baseUrl = "https://api.themoviedb.org/3";

  static const _baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String youtubePath(String key) =>
      "https://www.youtube.com/watch?v=$key";

 // static const String _apiKey = "8b62c46f238dec5717dbd4169229195f";

  /// Movie Constant

  static const String nowPlayingMoviePath =
      "$_baseUrl/movie/now_playing";

  static String popularMoviePath(int page) =>
      "$_baseUrl/movie/popular?&page=$page";

  static String topRatedPath(int page) =>
      "$_baseUrl/movie/top_rated?&page=$page";

  static String movieDetailPath(int id) =>
      "$_baseUrl/movie/$id?&append_to_response=videos,similar,credits";

  static String creditInfoPath(int personId) =>
      "$_baseUrl/person/$personId?&append_to_response=movie_credits,tv_credits,images";

  static String movieGenresPath() =>
      "$_baseUrl/genre/movie/list";

  static String movieByGenres(int genresId, int page) =>
      "$_baseUrl/discover/movie?&with_genres=$genresId&page=$page";

  static String searchPath(String query, SearchType searchType) =>
      "$_baseUrl/search/${searchType.name}?&query=$query";

  static String imageUrl(String path) => "$_baseImageUrl$path";

  ///  Tv constant

  static String popularTvPath(int page) =>
      "$_baseUrl/tv/popular?&page=$page";

  static String topRatedTvPath(int page) =>
      "$_baseUrl/tv/top_rated?&page=$page";

  static String WarTvPath(int page) =>
      "$_baseUrl/discover/tv?&page=$page&with_genres=10768";

  static String animationTvPath(int page) =>
      "$_baseUrl/discover/tv?&page=$page&with_genres=16";

  static String trendingTvPath(int page) =>
      "$_baseUrl/trending/tv/week?&page=$page";

  static String tvDetailPath(int id) =>
      "$_baseUrl/tv/$id?&append_to_response=videos,similar,credits";

  static String tvSeasonDetailPath(int tvId, int seasonNumber) =>
      "$_baseUrl/tv/$tvId/season/$seasonNumber?";

  static String tvGenresPath() => "$_baseUrl/genre/tv/list?";

  static String tvsShowsByGenres(int genresId, int page) =>
      "$_baseUrl/discover/tv?&with_genres=$genresId&page=$page";
}
