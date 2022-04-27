import 'package:advanced_tips/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/store_details_model.dart';
import '../repository/repository.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  Repository repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) {
    return repository.getStoreDetails();
  }
}