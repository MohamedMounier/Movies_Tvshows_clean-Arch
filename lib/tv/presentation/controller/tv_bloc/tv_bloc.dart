import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_watch_app/core/utils/enums.dart';
import 'package:to_watch_app/tv/domain/usecasses/get_popular_tv_use_case.dart';
import 'package:to_watch_app/tv/presentation/controller/tv_bloc/tv_state.dart';


part 'tv_event.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  GetPopularTvsUseCase getPopularTvsUseCase;
   TvBloc(this.getPopularTvsUseCase) : super(const TvState()) {
    on<GetPopularTvShowsEvent>(onGetPopularTvShows);
  }

  FutureOr<void> onGetPopularTvShows(GetPopularTvShowsEvent event, Emitter<TvState> emit)async {
   var result= await getPopularTvsUseCase.call(event.pageNumber);
   result.fold((l) =>emit(state.copyWith(
     errorMessage: l.errorMessage,
     popularRequestState: RequestState.isError,
   )) , (r) => emit(state.copyWith(
     popularTvshows: r,
     popularRequestState: RequestState.isLoaded,
   )));
  }
}
