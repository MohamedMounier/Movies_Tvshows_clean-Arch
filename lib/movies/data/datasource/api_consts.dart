class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKey="0923fb931efadfe73387edcee0accd7c";
  static const String getNowPlayingPath="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getTopRatedPath="$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String getPopularMoviesPath="$baseUrl/movie/popular?api_key=$apiKey";
  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  static  String imageUrl(String imagePath)=>"$baseImageUrl$imagePath";
  static  String getMovieDetailsPath(int movieId)=>"$baseUrl/movie/$movieId?api_key=$apiKey";
  static  String getMovieRecommPath(int movieId)=>"$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
}