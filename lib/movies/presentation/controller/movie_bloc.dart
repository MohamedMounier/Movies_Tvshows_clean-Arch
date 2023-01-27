
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_watch_app/core/usecases/base_usecases.dart';
import 'package:to_watch_app/core/utils/enums.dart';
import 'package:to_watch_app/movies/domain/entities/movie.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_playing_now_usecase.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_popular_usecase.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movies_top_rated_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MovieBloc(this.getNowPlayingMoviesUseCase,this.getPopularMoviesUseCase,this.getTopRatedMoviesUseCase) : super( const MovieState()) {

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMovieEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MovieState> emit)async {
    final result= await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(nowPlayingErrorMessage: l.errorMessage,nowPlayingReqState: RequestState.isError));
    }, (r) {
      emit(state.copyWith(nowPlayingReqState:RequestState.isLoaded,nowPlayingMovies: r ));

    });
  }

  Future<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MovieState> emit)async {
    final result= await getPopularMoviesUseCase((const NoParameters()));
    result.fold((l) {
      emit(state.copyWith(popularErrorMessage: l.errorMessage,popularReqState: RequestState.isError));
    }, (r) {
      emit(state.copyWith(popularReqState:RequestState.isLoaded,popularMovies: r ));

    });
  }

  Future<void> _getTopRatedMovies(GetTopRatedMovieEvent event, Emitter<MovieState> emit) async{
    final result= await getTopRatedMoviesUseCase((const NoParameters()));
    result.fold((l) {
      emit(state.copyWith(topRatedErrorMessage: l.errorMessage,topRatedReqState: RequestState.isError));
    }, (r) {
      emit(state.copyWith(topRatedReqState:RequestState.isLoaded,topRatedMovies: r ));

    });
  }
}
