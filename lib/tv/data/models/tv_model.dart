import 'package:to_watch_app/tv/domain/entities/tv.dart';

class TvModel extends Tv {
  TvModel(
      {required super.name,
      required super.overView,
      required super.backDropPath,
      required super.voteAverage,
      required super.id,
      required super.pageNumber,
      required super.firstAirDate});

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
      name:json['name'],
      overView: json['overview'],
      backDropPath: json['backdrop_path']??'/feU1DWV5zMWxXUHJyAIk3dHRQ9c.jpg',
      voteAverage: json['vote_average'].toDouble(),
      id: json['id'],
      pageNumber: json['page']??1,
      firstAirDate: json['first_air_date']);
}
