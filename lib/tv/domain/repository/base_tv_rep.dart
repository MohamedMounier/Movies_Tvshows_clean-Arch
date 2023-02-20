import 'package:dartz/dartz.dart';
import 'package:to_watch_app/core/error/failure.dart';

import '../entities/tv.dart';

abstract class BaseTvRepo{
 Future< Either<Failure,List<Tv>>> getPopularTvs(int pageNumber);
}