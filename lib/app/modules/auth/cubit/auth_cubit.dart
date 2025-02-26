import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  var stateData = const AuthStateData();
  AuthCubit(this.authRepository) : super(const AuthInitial());

  Future<void> authLogin(AuthRequestDto dto) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(AuthLoading(stateData));

    final result = await authRepository.authLogin(dto);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(AuthFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          successLogin: true,
          user: right,
        );
        emit(AuthLoaded(stateData));
      },
    );
  }

  Future<void> getIsLogin() async {
    final result = await authRepository.getIsLogin();
    stateData = stateData.copyWith(
      isLoaded: true,
      isLoading: false,
      isLogin: result,
    );
    emit(AuthLoaded(stateData));
  }

  // ######################

  Future<void> getLastLogin() async {
    final result = await authRepository.getLastLogin();
    stateData = stateData.copyWith(successLogin: false);
    emit(AuthLoaded(stateData));
  }
}
