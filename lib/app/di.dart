import 'package:advanced_tips/app/app_prefs.dart';
import 'package:advanced_tips/data/data_source/remote_data_source.dart';
import 'package:advanced_tips/data/network/app_api.dart';
import 'package:advanced_tips/data/network/dio_factory.dart';
import 'package:advanced_tips/data/network/network_info.dart';
import 'package:advanced_tips/data/repository_impl/repository_impl.dart';
import 'package:advanced_tips/domain/repository/repository.dart';
import 'package:advanced_tips/domain/usecase/login_usecase.dart';
import 'package:advanced_tips/presentation/modules/auth/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/forget_pass_usecase.dart';
import '../presentation/modules/auth/forget_pass/forget_pass_view_model.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

forgetpassModule() {
  if (!GetIt.I.isRegistered<ForgetPassUseCase>()) {
    instance.registerFactory<ForgetPassUseCase>(
        () => ForgetPassUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}
