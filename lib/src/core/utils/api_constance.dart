import 'package:movieapp/src/core/utils/enums.dart';

class ApiConstance {
  static const String _baseUrl = "https://api.themoviedb.org/3";

  static const _baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String youtubePath(String key) =>
      "https://www.youtube.com/watch?v=$key";

  static const String _apiKey = "8b62c46f238dec5717dbd4169229195f";

  /// Movie Constant

  static const String nowPlayingMoviePath =
      "$_baseUrl/movie/now_playing?api_key=$_apiKey";

  static String popularMoviePath(int page) =>
      "$_baseUrl/movie/popular?api_key=$_apiKey&page=$page";

  static String topRatedPath(int page) =>
      "$_baseUrl/movie/top_rated?api_key=$_apiKey&page=$page";

  static String movieDetailPath(int id) =>
      "$_baseUrl/movie/$id?api_key=$_apiKey&append_to_response=videos,similar,credits";

  static String creditInfoPath(int personId) =>
      "$_baseUrl/person/$personId?api_key=$_apiKey&append_to_response=movie_credits,tv_credits,images";

  static const String genresPath =
      "$_baseUrl/genre/movie/list?api_key=$_apiKey";

  static String movieByGenres(int genresId, int page) =>
      "$_baseUrl/discover/movie?api_key=$_apiKey&with_genres=$genresId&page=$page";

  static String searchMoviesPath(String query,SearchType searchType) =>
      "$_baseUrl/search/${searchType.name}?api_key=$_apiKey&query=$query";

  static String imageUrl(String path) => "$_baseImageUrl$path";

  ///  Tv constant

  static String popularTvPath(int page) =>
      "$_baseUrl/tv/popular?api_key=$_apiKey&page=$page";

  static String topRatedTvPath(int page) =>
      "$_baseUrl/tv/top_rated?api_key=$_apiKey&page=$page";

  static String WarTvPath(int page) =>
      "$_baseUrl/discover/tv?api_key=$_apiKey&page=$page&with_genres=10768";

  static String animationTvPath(int page) =>
      "$_baseUrl/discover/tv?api_key=$_apiKey&page=$page&with_genres=16";

  static String trendingTvPath(int page) =>
      "$_baseUrl/trending/tv/week?api_key=$_apiKey&page=$page";

  static String tvDetailPath(int id) =>
      "$_baseUrl/tv/$id?api_key=$_apiKey&append_to_response=videos,similar,credits";

  static String tvSeasonDetailPath(int tvId, int seasonNumber) =>
      "$_baseUrl/tv/$tvId/season/$seasonNumber?api_key=$_apiKey";
}
