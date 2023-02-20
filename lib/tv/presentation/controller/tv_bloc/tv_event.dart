part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];

}

class GetPopularTvShowsEvent extends TvEvent {
  final int pageNumber;

 const GetPopularTvShowsEvent(this.pageNumber);

  @override
  List<Object> get props => [pageNumber];
}
