import 'package:dartz/dartz.dart';

import '/path.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRemoteDatasource profileRemoteDatasource;
  AuthLocalDatasource authLocalDatasource;
  ProfileRepositoryImpl(
    this.profileRemoteDatasource,
    this.authLocalDatasource,
  );

  @override
  Future<Either<BaseResponseFailure, ProfileModel>> getProfile() async {
    try {
      var indentifier = await authLocalDatasource.getIdentifier();
      var token = await authLocalDatasource.getToken();
      print("getProfile");
      print(token);
      print(indentifier);
      var response = await profileRemoteDatasource.getProfile(
        token ?? '',
        indentifier ?? '',
      );

      if (response.isRight()) {
        var name = response.getOrElse(() {
          customErrorLog("Error get name from activation code : $response");
          throw Exception("Error get name");
        }).name;

        var email = response.getOrElse(() {
          customErrorLog("Error get email from activation code : $response");
          throw Exception("Error get email");
        }).email;

        await authLocalDatasource.saveIsLogin(true);
        await authLocalDatasource.saveLastLogin(email ?? '');
        await authLocalDatasource.saveName(name ?? '');
      }
      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, List<UniversityModel>>> getProgramStudy() async {
    return profileRemoteDatasource.getUniversity();
  }

  @override
  Future<Either<BaseResponseFailure, ProfileModel>> updateProfile(ChangeProfileRequestDto request) async {
    try {
      var token = await authLocalDatasource.getToken();
      var response = await profileRemoteDatasource.updateProfile(
        request,
        token,
      );

      if (response.isRight()) {
        var name = response.getOrElse(() {
          customErrorLog("Error get name from activation code : $response");
          throw Exception("Error get name");
        }).name;

        await authLocalDatasource.saveName(name!);
      }

      return response;
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> changePassword(ChangePasswordRequestDto request) async {
    try {
      var token = await authLocalDatasource.getToken();
      return profileRemoteDatasource.changePassword(
        request,
        token,
      );
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> removeAccount(RemoveAccountRequestDto request) async {
    try {
      return profileRemoteDatasource.removeAccount(request);
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }

  @override
  Future<Either<BaseResponseFailure, Meta>> deactiveAccount(RemoveAccountRequestDto request) async {
    try {
      return profileRemoteDatasource.deactiveAccount(request);
    } catch (e) {
      customErrorLog("error catch: $e");
      rethrow;
    }
  }
}
