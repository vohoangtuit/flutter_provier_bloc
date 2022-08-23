
import 'package:dio/dio.dart';
import 'package:flutter_provider/network/base/response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

@RestApi(baseUrl: '')
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String? baseUrl}) {
    return _ApiProvider(dio, baseUrl: baseUrl);
  }
  // todo: user
  @GET('getnews') // todo old
  Future<ResponseModel> getNews(Options cacheOptions) ;


}

