import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/core/usecases/base_usecases.dart';
import 'package:to_watch_app/movies/domain/entities/movie_details.dart';
import 'package:to_watch_app/movies/domain/repository/base_moviel_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCases<MovieDetails, MovieDetailsUseCaseParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetailsUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsUseCaseParameters parameters)async {
  return await baseMovieRepo.getMovieDetails(parameters.movieId);
  }
}

class MovieDetailsUseCaseParameters extends Equatable {
  final int movieId;

  const MovieDetailsUseCaseParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
