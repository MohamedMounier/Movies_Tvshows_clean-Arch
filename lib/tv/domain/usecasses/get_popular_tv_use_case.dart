import 'package:dartz/dartz.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/core/usecases/base_usecases.dart';
import 'package:to_watch_app/tv/domain/entities/tv.dart';
import 'package:to_watch_app/tv/domain/repository/base_tv_rep.dart';

class GetPopularTvsUseCase extends BaseUseCases<List<Tv>,int>{
  final BaseTvRepo baseTvRepo;

  GetPopularTvsUseCase(this.baseTvRepo);
  @override
  Future<Either<Failure, List<Tv>>> call(int pageNumber) {
    return baseTvRepo.getPopularTvs(pageNumber);
  }
}