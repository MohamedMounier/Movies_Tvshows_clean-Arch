import 'package:dio/dio.dart';
import 'package:to_watch_app/core/network/error_message_model.dart';
import 'package:to_watch_app/core/error/exceptions.dart';
import 'package:to_watch_app/movies/data/datasource/api_consts.dart';
import 'package:to_watch_app/movies/data/models/movie_details_model.dart';
import 'package:to_watch_app/movies/data/models/movie_model.dart';
import 'package:to_watch_app/movies/data/models/movie_recommendations_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getPlayingNowMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(int movieId);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getPlayingNowMovies() async{
   var response=await Dio().get(ApiConstance.getNowPlayingPath);

   if(response.statusCode==200){

     return List<MovieModel>.from((response.data["results"] as List).map((element) =>MovieModel.fromJson(element) ));
   }else{
     throw ServerException(ErrorMessageModel.fromJson(response.data));
   }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
    var response=await Dio().get(ApiConstance.getPopularMoviesPath);

    if(response.statusCode==200){

      return List<MovieModel>.from((response.data["results"] as List).map((element) =>MovieModel.fromJson(element) ));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()async {
    var response=await Dio().get(ApiConstance.getTopRatedPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((element) =>MovieModel.fromJson(element) ));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId)async {
    var response=await Dio().get(ApiConstance.getMovieDetailsPath(movieId));
    print('response ${response.statusCode}');
    if(response.statusCode==200){
      print('response ${response.data}');
      return MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(int movieId)async {
    // TODO: implement getMovieRecommendations
    var response=await Dio().get(ApiConstance.getMovieRecommPath(movieId));
    print('response ${response.statusCode}');
    if(response.statusCode==200){
      print('response ${response.data}');
      return List<MovieRecommendationsModel>.from((response.data["results"] as List).map((e) => MovieRecommendationsModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

}