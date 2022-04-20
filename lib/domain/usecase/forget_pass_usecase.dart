import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ForgetPassUseCase extends BaseUseCase<String, String> {
  final Repository _repository;
  ForgetPassUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgetpass(input);
  }
}
