part of 'otp_cubit.dart';

class OtpStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool otpSucces;
  final bool otpRegisterSucces;
  final bool isButtonEnabled;
  final bool requestOTP;
  final String? email;
  final Meta? meta;
  final ResponseMsg? responseMsg;
  final BaseResponseFailure? error;

  const OtpStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.otpSucces = false,
    this.isButtonEnabled = false,
    this.otpRegisterSucces = false,
    this.requestOTP = false,
    this.email,
    this.meta,
    this.responseMsg,
    this.error,
  });

  @override
  List<Object?> get props => [
    isLoading,
    isLoaded,
    otpSucces,
    otpRegisterSucces,
    isButtonEnabled,
    requestOTP,
    email,
    meta,
    responseMsg,
    error,
  ];

  OtpStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? otpSucces,
    bool? otpRegisterSucces,
    bool? isButtonEnabled,
    bool? requestOTP,
    String? email,
    Meta? meta,
    ResponseMsg? responseMsg,
    BaseResponseFailure? error,
  }) {
    return OtpStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      otpSucces: otpSucces ?? this.otpSucces,
      otpRegisterSucces: otpRegisterSucces ?? this.otpRegisterSucces,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      requestOTP: requestOTP ?? this.requestOTP,
      email: email ?? this.email,
      meta: meta ?? this.meta,
      responseMsg: responseMsg ?? this.responseMsg,
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
