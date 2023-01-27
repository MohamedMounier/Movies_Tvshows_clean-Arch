import 'package:get_it/get_it.dart';
import 'package:to_watch_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:to_watch_app/movies/data/repository/movie_repo.dart';
import 'package:to_watch_app/movies/domain/repository/base_moviel_repo.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_details_usecase.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_playing_now_usecase.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_popular_usecase.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movie_recommend_usecase.dart';
import 'package:to_watch_app/movies/domain/usecasses/get_movies_top_rated_usecase.dart';
import 'package:to_watch_app/movies/presentation/controller/movie_bloc.dart';
import 'package:to_watch_app/movies/presentation/controller/movie_details_bloc.dart';

final sl=GetIt.instance;

class ServiceLocator{
  void init(){
    ///blocs
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    ///useCases
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetMovieRecommendationsUseCase>(() => GetMovieRecommendationsUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepository(sl()));

    ///DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}