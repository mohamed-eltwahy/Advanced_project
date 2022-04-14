import 'package:dartz/dartz.dart';

import 'package:advanced_tips/data/network/failure.dart';
import 'package:advanced_tips/domain/repository/repository.dart';
import 'package:advanced_tips/domain/usecase/base_usecase.dart';

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
