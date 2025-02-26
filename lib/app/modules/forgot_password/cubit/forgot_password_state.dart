part of 'forgot_password_cubit.dart';

class ForgotPasswordStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool submitSuccess;
  final bool forgotSuccess;
  final String? email;
  final ResponseMsg? responseMsg;
  final BaseResponseFailure? error;

  const ForgotPasswordStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.submitSuccess = false,
    this.forgotSuccess = false,
    this.email,
    this.responseMsg,
    this.error,
  });

  @override
  List<Object?> get props => [
    isLoading,
    isLoaded,
    submitSuccess,
    forgotSuccess,
    email,
    responseMsg,
    error,
  ];

  ForgotPasswordStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? submitSuccess,
    bool? forgotSuccess,
    String? email,
    ResponseMsg? responseMsg,
    BaseResponseFailure? error,
  }) {
    return ForgotPasswordStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      submitSuccess: submitSuccess ?? this.submitSuccess,
      forgotSuccess: forgotSuccess ?? this.forgotSuccess,
      email: email ?? this.email,
      responseMsg: responseMsg ?? this.responseMsg,
      error: error ?? error,
    );
  }
}

sealed class ForgotPasswordState extends Equatable {
  final ForgotPasswordStateData data;
  const ForgotPasswordState(this.data);

  @override
  List<Object> get props => [data];
}

final class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial() : super(const ForgotPasswordStateData());
}

final class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading(super.data);
}

final class ForgotPasswordFailure extends ForgotPasswordState {
  const ForgotPasswordFailure(super.data);
}

final class ForgotPasswordLoaded extends ForgotPasswordState {
  const ForgotPasswordLoaded(super.data);
}
