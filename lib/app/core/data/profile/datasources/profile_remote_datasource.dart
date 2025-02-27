import 'package:dartz/dartz.dart';
import '/path.dart';

class ProfileRemoteDatasource extends BaseDioService {
  Future<Either<BaseResponseFailure, User>> getProfile(String email) async {
    var data = {"email": email};
    return await baseFunction<BaseResponseFailure, User>(
      fromJson: (data) => User.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.post(EndpointAPIV1.profile, data: data),
      keyData: ['data'],
      customLog: "Dari bagian get Profile",
    );
  }

  Future<Either<BaseResponseFailure, User>> updateProfile(
    ChangeProfileRequestDto request,
  ) async {
    return await baseFunction<BaseResponseFailure, User>(
      fromJson: (data) => User.fromJson(data),
      fromJsonError: (data) => BaseResponseFailure.fromJson(data),
      responseMethod: dio.put(
        EndpointAPIV1.profileUpdate,
        data: request.toMap(),
      ),
      keyData: ['data'],
      customLog:
          "Dari bagian update profile \n request menyeluruh : ${request.toString()}",
    );
  }
}
