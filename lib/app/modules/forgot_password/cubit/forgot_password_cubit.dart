import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository authRepository;
  var stateData = const ForgotPasswordStateData();
  ForgotPasswordCubit(
    this.authRepository,
  ) : super(const ForgotPasswordInitial());

  Future<void> forgotPasswordSubmit(String email) async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
    );
    emit(ForgotPasswordLoading(stateData));

    stateData = stateData.copyWith(
      isLoaded: true,
      isLoading: false,
      email: email,
      submitSuccess: true,
    );
    emit(ForgotPasswordLoaded(stateData));

    // final result = await authRepository.authForgotPassword(email);
    // result.fold(
    //   (left) {
    //     stateData = stateData.copyWith(error: left);
    //     emit(ForgotPasswordFailure(stateData));
    //   },
    //   (right) {
    //     stateData = stateData.copyWith(
    //       isLoaded: true,
    //       isLoading: false,
    //       email: email,
    //       forgotPasswordModel: right,
    //       submitSuccess: true,
    //     );
    //     emit(ForgotPasswordLoaded(stateData));
    //   },
    // );
  }

  Future<void> forgotPasswordFormSubmit(ForgotPasswordRequestDto request) async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
      submitSuccess: false,
    );
    emit(ForgotPasswordLoading(stateData));

    stateData = stateData.copyWith(
      isLoaded: true,
      isLoading: false,
      submitSuccess: true,
    );
    emit(ForgotPasswordLoaded(stateData));

    // final result = await authRepository.ForgotPasswordFormSubmit(request);
    // result.fold(
    //   (left) {
    //     stateData = stateData.copyWith(error: left);
    //     emit(ForgotPasswordFailure(stateData));
    //   },
    //   (right) {
    //     stateData = stateData.copyWith(
    //       isLoaded: true,
    //       isLoading: false,
    //       submitSuccess: true,
    //     );
    //     emit(ForgotPasswordLoaded(stateData));
    //   },
    // );
  }
}
