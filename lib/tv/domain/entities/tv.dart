import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String name;
  final String overView;
   String? backDropPath;
  final double voteAverage;
  final String firstAirDate;
  final int id;
   int? pageNumber;

  Tv({required this.name,
    required this.overView,
    required this.backDropPath,
    required this.voteAverage,
    required this.id,
    required this.pageNumber,
    required this.firstAirDate});

  @override
  List<Object> get props =>
      [name, overView, backDropPath!, voteAverage,pageNumber!, firstAirDate,id];

}
