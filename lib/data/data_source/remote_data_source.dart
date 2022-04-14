import 'package:advanced_tips/data/network/app_api.dart';
import 'package:advanced_tips/data/network/requests.dart';
import 'package:advanced_tips/data/response/forget_pass_response.dart';
import 'package:advanced_tips/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthonticationResponse> login(LoginRequest loginRequest);
  Future<ForgetResponse> forgetPass(String email);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(
    this._appServiceClient,
  );
  @override
  Future<AuthonticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgetResponse> forgetPass(String email) async {
    return await _appServiceClient.forgetPass(email);
  }
}
