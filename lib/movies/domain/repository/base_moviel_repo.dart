import 'package:dartz/dartz.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/movies/domain/entities/movie.dart';
import 'package:to_watch_app/movies/domain/entities/movie_details.dart';
import 'package:to_watch_app/movies/domain/entities/movie_recommendations.dart';

abstract class BaseMovieRepo{
  Future<Either<Failure ,List<Movie>>> getPlayingNowMovies();
  Future<Either<Failure ,List<Movie>>> getPopularMovies();
  Future<Either<Failure ,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure ,MovieDetails>> getMovieDetails(int movieId);
  Future<Either<Failure ,List<MovieRecommendations>>> getMovieRecommendation(int movieId);
}