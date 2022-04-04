import 'package:advanced_tips/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/consts.dart';
part 'app_api.g.dart';

@RestApi(
  baseUrl: Consts.baseURL,
)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customer/login")
  Future<AuthonticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
