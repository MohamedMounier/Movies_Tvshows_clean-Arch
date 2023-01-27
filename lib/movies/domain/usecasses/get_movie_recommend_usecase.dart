import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/core/usecases/base_usecases.dart';
import 'package:to_watch_app/movies/domain/entities/movie_recommendations.dart';
import 'package:to_watch_app/movies/domain/repository/base_moviel_repo.dart';

class GetMovieRecommendationsUseCase
    extends BaseUseCases<
        List<MovieRecommendations>,
        MovieRecommendationsUseCaseParameters> {
  final BaseMovieRepo baseMovieRepo;

   GetMovieRecommendationsUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<MovieRecommendations>>> call(MovieRecommendationsUseCaseParameters parameters)async {
   return await baseMovieRepo.getMovieRecommendation(parameters.movieId);
  }

}

class MovieRecommendationsUseCaseParameters extends Equatable {
  final int movieId;

 const MovieRecommendationsUseCaseParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}