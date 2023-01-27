import 'package:dartz/dartz.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/core/usecases/base_usecases.dart';
import 'package:to_watch_app/movies/domain/entities/movie.dart';
import 'package:to_watch_app/movies/domain/repository/base_moviel_repo.dart';

class GetNowPlayingMoviesUseCase  extends BaseUseCases<List<Movie>,NoParameters>{
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingMoviesUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure ,List<Movie>>>call(NoParameters parameters)async{
    return await baseMovieRepo.getPlayingNowMovies();
  }
}