import 'package:advanced_tips/data/network/requests.dart';
import 'package:advanced_tips/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import 'package:advanced_tips/data/network/failure.dart';
import 'package:advanced_tips/domain/model/models.dart';
import 'package:advanced_tips/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authontication> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authontication>> execute(
      LoginUseCaseInput input) async {
    return await _repository
        .login(LoginRequest(email: input.email, password: input.password));
  }
}

class LoginUseCaseInput {
  String email, password;
  LoginUseCaseInput(
    this.email,
    this.password,
  );
}
