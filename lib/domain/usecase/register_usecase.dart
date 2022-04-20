import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../model/models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authontication> {
  final Repository _repository;
  RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, Authontication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
        userName: input.userName,
        countryMobileCode: input.countryMobileCode,
        mobileNumber: input.mobileNumber,
        email: input.email,
        password: input.password,
        profilePicture: input.profilePicture));
  }
}

class RegisterUseCaseInput {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;
  RegisterUseCaseInput(
    this.userName,
    this.countryMobileCode,
    this.mobileNumber,
    this.email,
    this.password,
    this.profilePicture,
  );
}
