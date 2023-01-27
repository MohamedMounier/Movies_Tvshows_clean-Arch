import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:to_watch_app/core/utils/enums.dart';
import 'package:to_watch_app/movies/domain/entities/movie_details.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_details_usecase.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_recommend_usecase.dart';

import '../../domain/entities/movie_recommendations.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getMovieRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsUseCaseParameters(movieId: event.movieId));
    result.fold(
        (l) => emit(state.copyWith(
            detailsErrorMessage: l.errorMessage,
            detailsRequestState: RequestState.isError)),
        (r) => emit(state.copyWith(
            movieDetails: r, detailsRequestState: RequestState.isLoaded)));
  }

  FutureOr<void> _getRecommendations(
      GetRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationsUseCase(
        MovieRecommendationsUseCaseParameters(movieId: event.movieId));
    result.fold(
        (l) => emit(state.copyWith(recommendErrorMessage: l.errorMessage,recommendationRequestState: RequestState.isError)),
        (r) => emit(state.copyWith(recommendations: r,recommendationRequestState: RequestState.isLoaded)));
  }
}
