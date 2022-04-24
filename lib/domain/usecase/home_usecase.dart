
import 'package:advanced_tips/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/home_model.dart';
import '../repository/repository.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}