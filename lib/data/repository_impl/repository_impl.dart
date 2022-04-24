import 'package:advanced_tips/data/mapper/home_mapper.dart';
import 'package:advanced_tips/domain/model/home_model.dart';

import '../mapper/mapper.dart';
import '../network/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../data_source/remote_data_source.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';
import '../../domain/model/models.dart';

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

  @override
  Future<Either<Failure, String>> forgetpass(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.forgetPass(email);

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

  @override
  Future<Either<Failure, Authontication>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerRequest);

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

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getDataHome();

        if (response.status == ApiInternalStatus.Sucess) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.Failure,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
