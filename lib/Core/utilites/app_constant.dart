class AppConstant {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'ab178eeb123b703620acaa5d76cb10c7';
  static const String nowPlayingMovies =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMovies = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMovies =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}