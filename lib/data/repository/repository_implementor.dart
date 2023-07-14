import 'package:advanced_flutter_course/app/constants.dart';
import 'package:advanced_flutter_course/data/mapper/mapper.dart';
import 'package:advanced_flutter_course/data/network/error_handler.dart';
import 'package:advanced_flutter_course/data/network/failure.dart';
import 'package:advanced_flutter_course/data/request/request.dart';
import 'package:advanced_flutter_course/domain/model/model.dart';
import 'package:advanced_flutter_course/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImplementor extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImplementor(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if(await _networkInfo.isConnectedToInternet) {
      try {
        // ITS SAFE TO CALL THE API
        final response = await _remoteDataSource.login(loginRequest);
        if(response.status == ApiInternalStatus.success) {
          // SUCCESS
          // RETURN RIGHT
          return Right(response.toDomain());
        }
        else {
          // ERROR
          // RETURN LEFT
          return Left(Failure(response.status ?? ApiInternalStatus.failure, response.message ?? ResponseMessage.unknown));
        }
      }
      catch(error) {
        return(Left(ErrorHandler.handle(error).failure));
      }
    }
    else {
      // RETURN CONNECTION ERROR
      // return Left(Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection));
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
