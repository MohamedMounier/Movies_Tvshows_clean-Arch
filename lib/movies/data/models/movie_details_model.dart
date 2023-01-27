import 'package:to_watch_app/movies/data/models/genres_model.dart';
import 'package:to_watch_app/movies/domain/entities/genres.dart';
import 'package:to_watch_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.runtime,
      required super.title,
      required super.genres,
      required super.backdropPath,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
      id: json["id"],
      title: json["title"],
      genres: List<Genres>.from((json["genres"] as List).map((e) => GenresModel.fromJson(e))),
      backdropPath: json["backdrop_path"]??'/feU1DWV5zMWxXUHJyAIk3dHRQ9c.jpg',
      overview: json["overview"],
      runtime: json["runtime"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"]);
}
