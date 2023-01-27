import 'package:dartz/dartz.dart';
import 'package:to_watch_app/core/error/exceptions.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:to_watch_app/movies/domain/entities/movie.dart';
import 'package:to_watch_app/movies/domain/entities/movie_details.dart';
import 'package:to_watch_app/movies/domain/entities/movie_recommendations.dart';
import 'package:to_watch_app/movies/domain/repository/base_moviel_repo.dart';

class MovieRepository extends BaseMovieRepo{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure ,List<Movie>>> getPlayingNowMovies()async {
    var result= await baseMovieRemoteDataSource.getPlayingNowMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure ,List<Movie>>> getPopularMovies()async {
    var result= await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure ,List<Movie>>> getTopRatedMovies()async {
    var result= await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId)async {
    var result= await baseMovieRemoteDataSource.getMovieDetails(movieId);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendations>>> getMovieRecommendation(int movieId)async {
    var result= await baseMovieRemoteDataSource.getMovieRecommendations(movieId);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}