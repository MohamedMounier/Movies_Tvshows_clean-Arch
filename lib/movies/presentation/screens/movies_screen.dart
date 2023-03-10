
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_watch_app/core/utils/services/service_locator.dart';
import 'package:to_watch_app/movies/presentation/components/now_playing_component.dart';
import 'package:to_watch_app/movies/presentation/components/popular_movies_component.dart';
import 'package:to_watch_app/movies/presentation/components/top_rated_movies_component.dart';
import 'package:to_watch_app/movies/presentation/controller/movie_bloc.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => MovieBloc(sl(), sl(), sl())
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMovieEvent()),
      child: RefreshIndicator(
        onRefresh: ()async {
          MovieBloc(sl(), sl(), sl())
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMovieEvent());
        },
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NowPlayingMoviesComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO POPULAR SCREEN
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MovieDetailScreen(id: item.)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text('See More'),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopularMoviesComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO Top Rated Movies Screen
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text('See More'),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TopRatedMoviesComponent(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
