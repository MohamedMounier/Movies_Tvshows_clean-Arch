part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}
class GetNowPlayingMoviesEvent extends MovieEvent{}
class GetPopularMoviesEvent extends MovieEvent{}
class GetTopRatedMovieEvent extends MovieEvent{}


