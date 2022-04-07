import 'package:advanced_tips/data/mapper/mapper.dart';
import 'package:advanced_tips/data/network/error_handler.dart';
import 'package:dartz/dartz.dart';

import 'package:advanced_tips/data/data_source/remote_data_source.dart';
import 'package:advanced_tips/data/network/failure.dart';
import 'package:advanced_tips/data/network/network_info.dart';
import 'package:advanced_tips/data/network/requests.dart';
import 'package:advanced_tips/domain/model/models.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, Authontication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.Sucess) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.Failure,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
