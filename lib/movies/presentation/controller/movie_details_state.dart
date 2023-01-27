part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState detailsRequestState;
  final String detailsErrorMessage;
  final List<MovieRecommendations> recommendations;
  final RequestState recommendationRequestState;
  final String recommendErrorMessage;

  const MovieDetailsState(
      {
        this.movieDetails,
        this.detailsRequestState=RequestState.isLoading,
       this.detailsErrorMessage='',
       this.recommendations=const [],
         this.recommendationRequestState=RequestState.isLoading,
         this.recommendErrorMessage=''
      });

   MovieDetailsState copyWith({
     MovieDetails? movieDetails,
     RequestState? detailsRequestState,
     String? detailsErrorMessage,
     List<MovieRecommendations>? recommendations,
    RequestState? recommendationRequestState,
    String? recommendErrorMessage,
  }) {
    return  MovieDetailsState(
        movieDetails: movieDetails??this.movieDetails,
        detailsRequestState:  detailsRequestState??this.detailsRequestState,
        detailsErrorMessage:  detailsErrorMessage??this.detailsErrorMessage,
        recommendations:  recommendations??this.recommendations,
       recommendationRequestState: recommendationRequestState??this.recommendationRequestState,
       recommendErrorMessage: recommendErrorMessage??this.recommendErrorMessage

     );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        detailsRequestState,
        detailsErrorMessage,
      ];
}
