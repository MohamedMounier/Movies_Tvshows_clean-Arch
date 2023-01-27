part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingReqState;
  final String nowPlayingErrorMessage;
  final List<Movie> popularMovies;
  final RequestState popularReqState;
  final String popularErrorMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedReqState;
  final String topRatedErrorMessage;

  const MovieState({
    this.nowPlayingMovies = const[],
    this.nowPlayingReqState = RequestState.isLoading,
    this.nowPlayingErrorMessage = '',
    this.popularMovies = const[],
    this.popularReqState = RequestState.isLoading,
    this.popularErrorMessage = '',
    this.topRatedMovies = const[],
    this.topRatedReqState = RequestState.isLoading,
    this.topRatedErrorMessage = '',
  });

  MovieState copyWith(
      {
         List<Movie>? nowPlayingMovies,
         RequestState? nowPlayingReqState,
         String? nowPlayingErrorMessage,
         List<Movie>? popularMovies,
         RequestState? popularReqState,
         String? popularErrorMessage,
         List<Movie>? topRatedMovies,
         RequestState? topRatedReqState,
         String? topRatedErrorMessage
      }
      ){
    return MovieState(
      nowPlayingMovies: nowPlayingMovies??this.nowPlayingMovies,
      nowPlayingReqState: nowPlayingReqState??this.nowPlayingReqState,
      nowPlayingErrorMessage: nowPlayingErrorMessage??this.nowPlayingErrorMessage,
      popularMovies: popularMovies??this.popularMovies,
      popularReqState: popularReqState??this.popularReqState,
      popularErrorMessage: popularErrorMessage??this.popularErrorMessage,
      topRatedMovies: topRatedMovies??this.topRatedMovies,
      topRatedReqState: topRatedReqState??this.topRatedReqState,
      topRatedErrorMessage: topRatedErrorMessage??this.topRatedErrorMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingReqState,
        nowPlayingErrorMessage,
        popularMovies,
        popularReqState,
        popularErrorMessage,
        topRatedMovies,
        topRatedReqState,
        topRatedErrorMessage,
      ];
}

class MoviesInitiated extends MovieState {}

class MoviesLoaded extends MovieState {}
