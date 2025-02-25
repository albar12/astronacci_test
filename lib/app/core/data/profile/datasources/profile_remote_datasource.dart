import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '/path.dart';

class ProfileRemoteDatasource extends BaseDioService {
  Future<Either<BaseResponseFailure, ProfileModel>> getProfile(
    String token,
    String identifier,
  ) async {
    var header = {
      "Authorization": "bearer $token",
    };
    return await baseFunction<BaseResponseFailure, ProfileModel>(
      fromJson: (data) => ProfileModel.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.get(
        "${EndpointAPIV1.memberProfile}/${AppConfig.brand}/$identifier",
        options: Options(
          headers: header,
        ),
      ),
      keyData: ['data'],
      customLog: "Dari bagian get Profile",
    );
  }

  Future<Either<BaseResponseFailure, List<UniversityModel>>> getUniversity() async {
    return await baseFunction<BaseResponseFailure, List<UniversityModel>>(
      fromJsonList: (_, data) => List<UniversityModel>.from(
        data.map((x) => UniversityModel.fromJson(x)),
      ),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.get('${EndpointAPIV1.university}/combo-data/MASUKAPOTEKER'),
      wihtMetaList: false,
      customLog: "Dari bagian get university",
    );
  }

  Future<Either<BaseResponseFailure, ProfileModel>> updateProfile(
    ChangeProfileRequestDto request,
    String? token,
  ) async {
    var headers = {
      'Authorization': "Bearer $token",
    };
    return await baseFunction<BaseResponseFailure, ProfileModel>(
      fromJson: (data) => ProfileModel.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put(
        '${EndpointAPIV1.memberProfile}/${AppConfig.brand}',
        data: request.toMap(),
        options: Options(
          headers: headers,
        ),
      ),
      keyData: ['data'],
      customLog: "Dari bagian update profile \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> changePassword(
    ChangePasswordRequestDto request,
    String? token,
  ) async {
    var headers = {
      'Authorization': "Bearer $token",
    };
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put(
        '${EndpointAPIV1.memberProfile}/${AppConfig.brand}/password',
        data: request.toMap(),
        options: Options(
          headers: headers,
        ),
      ),
      keyData: ['meta'],
      customLog: "Dari bagian change password \n request menyeluruh : ${request.toString()}",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> removeAccount(RemoveAccountRequestDto request) async {
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.delete(
        "${EndpointAPIV1.member}/${AppConfig.brand}/delete",
        data: request.toMap(),
      ),
      keyData: ['meta'],
      customLog: "Dari bagian remove account",
    );
  }

  Future<Either<BaseResponseFailure, Meta>> deactiveAccount(RemoveAccountRequestDto request) async {
    return await baseFunction<BaseResponseFailure, Meta>(
      fromJson: (data) => Meta.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put(
        "${EndpointAPIV1.member}/${AppConfig.brand}/deactivated",
        data: request.toMap(),
      ),
      keyData: ['meta'],
      customLog: "Dari bagian deactive account",
    );
  }
}
