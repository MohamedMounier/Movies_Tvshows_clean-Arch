import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_watch_app/core/error/exceptions.dart';
import 'package:to_watch_app/core/error/failure.dart';
import 'package:to_watch_app/core/network/error_message_model.dart';
import 'package:to_watch_app/tv/data/datasource/api_consts.dart';
import 'package:to_watch_app/tv/data/models/tv_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> fetchPopularTv(int pageNumber);
}
class TvRemoteDataSource extends BaseTvRemoteDataSource{
  @override
  Future<List<TvModel>> fetchPopularTv(int pageNumber) async{
   final response=await Dio().get(ApiTvConstance.getPopularTvsPage(pageNumber));
   if(response.statusCode==200){
     return List<TvModel>.from(response.data['results'].map((e) => TvModel.fromJson(e)).toList());
   }else{
     throw ServerException(ErrorMessageModel.fromJson(response.data));
   }
  }
  
}