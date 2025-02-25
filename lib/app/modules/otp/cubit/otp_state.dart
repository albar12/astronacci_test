part of 'otp_cubit.dart';

class OtpStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool otpSucces;
  final bool otpRegisterSucces;
  final bool removeAccountSucces;
  final bool deactiveAccountSucces;
  final bool isButtonEnabled;
  final bool requestSucces;
  final Meta? meta;
  final BaseResponseFailure? error;

  const OtpStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.otpSucces = false,
    this.isButtonEnabled = false,
    this.otpRegisterSucces = false,
    this.removeAccountSucces = false,
    this.deactiveAccountSucces = false,
    this.requestSucces = false,
    this.meta,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        otpSucces,
        otpRegisterSucces,
        removeAccountSucces,
        deactiveAccountSucces,
        isButtonEnabled,
        requestSucces,
        meta,
        error,
      ];

  OtpStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? otpSucces,
    bool? otpRegisterSucces,
    bool? removeAccountSucces,
    bool? deactiveAccountSucces,
    bool? isButtonEnabled,
    bool? requestSucces,
    Meta? meta,
    BaseResponseFailure? error,
  }) {
    return OtpStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      otpSucces: otpSucces ?? this.otpSucces,
      otpRegisterSucces: otpRegisterSucces ?? this.otpRegisterSucces,
      removeAccountSucces: removeAccountSucces ?? this.removeAccountSucces,
      deactiveAccountSucces: deactiveAccountSucces ?? this.deactiveAccountSucces,
      requestSucces: requestSucces ?? this.requestSucces,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      meta: meta ?? this.meta,
      error: error ?? error,
    );
  }
}

sealed class OtpState extends Equatable {
  final OtpStateData data;
  const OtpState(this.data);

  @override
  List<Object> get props => [data];
}

final class OtpInitial extends OtpState {
  const OtpInitial() : super(const OtpStateData());
}

final class OtpLoading extends OtpState {
  const OtpLoading(super.data);
}

final class OtpFailure extends OtpState {
  const OtpFailure(super.data);
}

final class OtpLoaded extends OtpState {
  const OtpLoaded(super.data);
}
