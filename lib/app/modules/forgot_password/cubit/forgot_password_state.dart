part of 'forgot_password_cubit.dart';

class ForgotPasswordStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool submitSuccess;
  final String? email;
  final ForgotPasswordModel? forgotPasswordModel;
  final BaseResponseFailure? error;

  const ForgotPasswordStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.submitSuccess = false,
    this.email,
    this.forgotPasswordModel,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        submitSuccess,
        email,
        forgotPasswordModel,
        error,
      ];

  ForgotPasswordStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? submitSuccess,
    String? email,
    ForgotPasswordModel? forgotPasswordModel,
    BaseResponseFailure? error,
  }) {
    return ForgotPasswordStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      submitSuccess: submitSuccess ?? this.submitSuccess,
      email: email ?? this.email,
      forgotPasswordModel: forgotPasswordModel ?? this.forgotPasswordModel,
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
  const ForgotPasswordInitial() : super(const ForgotPasswordStateData(submitSuccess: false));
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
