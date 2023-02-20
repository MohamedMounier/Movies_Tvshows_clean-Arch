import 'package:dartz/dartz.dart';
import 'package:to_watch_app/core/error/exceptions.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/tv/data/datasource/tv_remote_data_source.dart';
import 'package:to_watch_app/tv/domain/entities/tv.dart';
import 'package:to_watch_app/tv/domain/repository/base_tv_rep.dart';

class TvRepo extends BaseTvRepo{
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepo(this.baseTvRemoteDataSource);
  @override
  Future<Either<Failure, List<Tv>>> getPopularTvs(int pageNumber)async {
    var result=await baseTvRemoteDataSource.fetchPopularTv(pageNumber);
    try{
     return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

}