class ApiTvConstance{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKey="0923fb931efadfe73387edcee0accd7c";
  static const String getPopularTvPath="$baseUrl/tv/popular?api_key=$apiKey";
  static String getPopularTvsPage(int pageNumber)=>'$getPopularTvPath&page=$pageNumber';


}