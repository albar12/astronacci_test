import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final ProfileRepository profileRepository;
  final AuthRepository authRepository;
  var stateData = const SplashStateData();
  SplashCubit(this.profileRepository, this.authRepository)
    : super(const SplashInitial());

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
