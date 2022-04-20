import '../model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';

abstract class Repository {
  Future<Either<Failure, Authontication>> login(LoginRequest loginRequest);

  Future<Either<Failure, String>> forgetpass(String email);

  Future<Either<Failure, Authontication>> register(RegisterRequest registerRequest);

}
