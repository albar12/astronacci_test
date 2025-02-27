import 'package:dartz/dartz.dart';

import '/path.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRemoteDatasource profileRemoteDatasource;
  AuthLocalDatasource authLocalDatasource;
  ProfileRepositoryImpl(this.profileRemoteDatasource, this.authLocalDatasource);

  @override
  Future<Either<BaseResponseFailure, User>> getProfile() async {
    try {
      var email = await authLocalDatasource.getEmail();

      var response = await profileRemoteDatasource.getProfile(email ?? '');
      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, User>> updateProfile(
    ChangeProfileRequestDto request,
  ) async {
    try {
      return await profileRemoteDatasource.updateProfile(request);
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }
}
