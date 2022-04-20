import '../network/app_api.dart';
import '../network/requests.dart';
import '../response/forget_pass_response.dart';
import '../response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthonticationResponse> login(LoginRequest loginRequest);
  Future<ForgetResponse> forgetPass(String email);
  Future<AuthonticationResponse> register(RegisterRequest registerRequest);
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

  @override
  Future<AuthonticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password,
        ""
        // registerRequest.profilePicture
        );
  }
}
