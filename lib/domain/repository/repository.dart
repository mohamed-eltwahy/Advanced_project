import '../model/home_model.dart';
import '../model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../model/store_details_model.dart';

abstract class Repository {
  Future<Either<Failure, Authontication>> login(LoginRequest loginRequest);

  Future<Either<Failure, String>> forgetpass(String email);

  Future<Either<Failure, Authontication>> register(RegisterRequest registerRequest);
  Future<Either<Failure, HomeObject>> getHomeData();
    Future<Either<Failure, StoreDetails>> getStoreDetails();

}
