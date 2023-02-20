


import 'package:equatable/equatable.dart';
import 'package:to_watch_app/core/utils/enums.dart';
import 'package:to_watch_app/tv/domain/entities/tv.dart';

class TvState extends Equatable {
  final RequestState popularRequestState;
  final String errorMessage;
  final List<Tv> popularTvshows;

  const TvState(
      { this.popularRequestState=RequestState.isLoading,
       this.errorMessage='',
       this.popularTvshows=const[]});

  TvState copyWith({
    RequestState? popularRequestState,
    String? errorMessage,
    List<Tv>? popularTvshows,
  }) {
    return TvState(
        popularRequestState: popularRequestState??this.popularRequestState ,
        errorMessage: errorMessage ?? this.errorMessage,
        popularTvshows: popularTvshows ?? this.popularTvshows);
  }

  @override
  List<Object> get props => [
        popularRequestState,
        errorMessage,
        popularTvshows,
      ];
}
