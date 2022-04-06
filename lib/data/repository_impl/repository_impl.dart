import 'package:advanced_tips/data/mapper/mapper.dart';
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
        final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(code: 409, message:response.message ??"an error occured"));
      }
    } else {
            return Left(Failure(code: 501, message:"please check your internet !"));

    }
  }
}
