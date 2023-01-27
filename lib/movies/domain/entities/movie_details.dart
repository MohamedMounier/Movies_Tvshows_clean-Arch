import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final int runtime;
  final String title;
  final List<Genres> genres;
  final String? backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.genres,
    required this.backdropPath,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
    required this.releaseDate,
  });
  @override
  List<Object?> get props =>
      [id, title, genres, backdropPath, overview, voteAverage,runtime];

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //         other is Movie &&
  //             runtimeType == other.runtimeType &&
  //             id == other.id &&
  //             title == other.title &&
  //             genreIds == other.genreIds &&
  //             backdropPath == other.backdropPath &&
  //             overview == other.overview &&
  //             voteAverage == other.voteAverage;
  //
  // @override
  // int get hashCode =>
  //     title.hashCode ^
  //     genreIds.hashCode ^
  //     backdropPath.hashCode ^
  //     overview.hashCode ^
  //     voteAverage.hashCode;


}
