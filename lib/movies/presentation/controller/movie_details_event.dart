part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();


}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class GetRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

 const GetRecommendationsEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}