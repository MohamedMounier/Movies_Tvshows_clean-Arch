import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final List<int> genreIds;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.genreIds,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });
  @override
  List<Object> get props =>
      [id, title, genreIds, backdropPath, overview, voteAverage,];

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
