import '../response/home_respose.dart';
import '../response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/consts.dart';
import '../response/forget_pass_response.dart';
import '../response/store_details_response.dart';
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

  @POST("/customer/forgetPassword")
  Future<ForgetResponse> forgetPass(
    @Field("email") String email,
  );

  @POST("/customer/register")
  Future<AuthonticationResponse> register(
    @Field("user_name") String userName,
    @Field("country_mobile_code") String countryMobileCode,
    @Field("mobile_number") String mobileNumber,
    @Field("email") String email,
    @Field("password") String password,
    @Field("profile_picture") String profilePicture,
  );

   @GET("/home")
  Future<HomeResponse> getHomeData();
     @GET("/storeDetails/1")
  Future<StoreDetailsResponse > getStoreDetails();
}
