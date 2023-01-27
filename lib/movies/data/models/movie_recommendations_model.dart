import 'package:to_watch_app/movies/domain/entities/movie_recommendations.dart';

class MovieRecommendationsModel extends MovieRecommendations{
  const MovieRecommendationsModel({required super.id, required super.backdropPath});
  factory MovieRecommendationsModel.fromJson(Map<String,dynamic>json){
    return MovieRecommendationsModel(id: json['id'],
        backdropPath: json['backdrop_path']??'/feU1DWV5zMWxXUHJyAIk3dHRQ9c.jpg');
  }
}