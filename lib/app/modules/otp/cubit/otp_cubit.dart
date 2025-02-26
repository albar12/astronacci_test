import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final AuthRepository authRepository;
  final ProfileRepository profileRepository;

  var stateData = const OtpStateData();
  OtpCubit(this.authRepository, this.profileRepository)
    : super(const OtpInitial());

  Future<void> requestOTP(String email) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(OtpLoading(stateData));

    final result = await authRepository.requestOTPRegister(email);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          requestOTP: true,
          responseMsg: right,
        );
        emit(OtpLoaded(stateData));
      },
    );
  }

  Future<void> verifyRegister(String email, String code) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(OtpLoading(stateData));

    final result = await authRepository.verifyRegister(email, code);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) async {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          otpRegisterSucces: true,
          responseMsg: right,
        );
        emit(OtpLoaded(stateData));
      },
    );
  }

  // #############################

  Future<void> requestOTPForgot(String email) async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
      otpRegisterSucces: false,
    );
    emit(OtpLoading(stateData));

    final result = await authRepository.requestOTP(email);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          otpSucces: false,
          meta: right,
        );
        emit(OtpLoaded(stateData));
      },
    );
  }

  Future<void> verifyForgotPassword(String email, String code) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(OtpLoading(stateData));

    final result = await authRepository.verifyForgotPassword(email, code);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          otpSucces: true,
        );
        emit(OtpLoaded(stateData));
      },
    );
  }

  Future<void> isButtonEnabled(bool isEnable) async {
    stateData = stateData.copyWith(
      isLoaded: true,
      isLoading: false,
      isButtonEnabled: isEnable,
    );
    emit(OtpLoaded(stateData));
  }

  Future<void> requestOTPRemoveAccount(String email) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(OtpLoading(stateData));

    final result = await authRepository.requestOTPRemoveAccount(email);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          meta: right,
        );
        emit(OtpLoaded(stateData));
      },
    );
  }

  Future<void> verifyRemoveAccount(String email, String code) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(OtpLoading(stateData));

    final result = await authRepository.verifyRemoveAccount(email, code);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(isLoaded: true, isLoading: false);
        emit(OtpLoaded(stateData));
      },
    );
  }

  Future<void> requestOTPDeactiveAccount(String email) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(OtpLoading(stateData));

    final result = await authRepository.requestOTPDeactiveAccount(email);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          meta: right,
        );
        emit(OtpLoaded(stateData));
      },
    );
  }

  Future<void> verifyDeactiveAccount(String email, String code) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(OtpLoading(stateData));

    final result = await authRepository.verifyDeactiveAccount(email, code);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(OtpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(isLoaded: true, isLoading: false);
        emit(OtpLoaded(stateData));
      },
    );
  }
}
