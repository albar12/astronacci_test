import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final ProfileRepository profileRepository;
  final AuthRepository authRepository;
  var stateData = const SplashStateData();
  SplashCubit(
    this.profileRepository,
    this.authRepository,
  ) : super(const SplashInitial());

  Future<void> getProfile() async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
    );
    emit(SplashLoading(stateData));

    final result = await profileRepository.getProfile();
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(SplashError(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          isGetProfileSuccess: true,
          refreshTokenSuccess: false,
        );
        emit(SplashLoaded(stateData));
      },
    );
  }

  Future<void> refreshToken() async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
    );
    emit(SplashLoading(stateData));

    var refreshToken = await authRepository.getRefreshToken();
    final result = await authRepository.refreshToken(refreshToken ?? '');
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(SplashError(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          isGetProfileSuccess: false,
          refreshTokenSuccess: true,
        );
        emit(SplashLoaded(stateData));
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
    emit(SplashLoaded(stateData));
  }
}
