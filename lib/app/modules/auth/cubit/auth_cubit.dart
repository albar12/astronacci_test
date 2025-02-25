import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  var stateData = const AuthStateData();
  AuthCubit(this.authRepository) : super(const AuthInitial());

  Future<void> authLogin(AuthRequestDto dto) async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
      auth: null,
      truncateSuccess: false,
    );
    emit(AuthLoading(stateData));

    stateData = stateData.copyWith(
      isLoaded: true,
      isLoading: false,
      successLogin: true,
      dataIsFound: true,
      error: null,
      isActivation: false,
    );
    emit(AuthLoaded(stateData));

    // final result = await authRepository.authLogin(dto);
    // result.fold(
    //   (left) {
    //     if (left.meta.message == 'Data found, but account is not active') {
    //       stateData = stateData.copyWith(
    //         error: left,
    //         isActivation: true,
    //         emailOTP: left.meta.emailOTP,
    //       );
    //       emit(AuthFailure(stateData));
    //     } else {
    //       stateData = stateData.copyWith(
    //         error: left,
    //       );
    //       emit(AuthFailure(stateData));
    //     }
    //   },
    //   (right) {
    //     stateData = stateData.copyWith(
    //       isLoaded: true,
    //       isLoading: false,
    //       successLogin: right.id != null ? true : false,
    //       dataIsFound: true,
    //       auth: right,
    //       error: null,
    //       isActivation: false,
    //     );
    //     emit(AuthLoaded(stateData));
    //   },
    // );
  }

  Future<void> getLastLogin() async {
    final result = await authRepository.getLastLogin();
    stateData = stateData.copyWith(
      lastLogin: result,
      successLogin: false,
      dataIsFound: false,
    );
    emit(AuthLoaded(stateData));
  }

  Future<void> accountActivation() async {
    stateData = stateData.copyWith(dataIsFound: true, isActivation: false);
    emit(AuthLoaded(stateData));
  }
}
