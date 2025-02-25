part of 'auth_cubit.dart';

class AuthStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool successLogin;
  final bool truncateSuccess;
  final bool sameLogin;
  final bool dataIsFound;
  final bool isActivation;
  final String? lastLogin;
  final String? emailOTP;
  final Auth? auth;
  final AuthRequestDto? authDto;
  final BaseResponseFailure? error;

  const AuthStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.successLogin = false,
    this.truncateSuccess = false,
    this.sameLogin = false,
    this.dataIsFound = false,
    this.isActivation = false,
    this.emailOTP,
    this.auth,
    this.authDto,
    this.lastLogin,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        successLogin,
        truncateSuccess,
        sameLogin,
        dataIsFound,
        isActivation,
        emailOTP,
        auth,
        authDto,
        lastLogin,
        error,
      ];

  AuthStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? successLogin,
    bool? truncateSuccess,
    bool? sameLogin,
    bool? dataIsFound,
    bool? isActivation,
    String? lastLogin,
    String? emailOTP,
    Auth? auth,
    AuthRequestDto? authDto,
    BaseResponseFailure? error,
  }) {
    return AuthStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      successLogin: successLogin ?? this.successLogin,
      truncateSuccess: truncateSuccess ?? this.truncateSuccess,
      sameLogin: sameLogin ?? this.sameLogin,
      dataIsFound: dataIsFound ?? this.dataIsFound,
      isActivation: isActivation ?? this.isActivation,
      lastLogin: lastLogin ?? this.lastLogin,
      emailOTP: emailOTP ?? this.emailOTP,
      auth: auth ?? this.auth,
      authDto: authDto ?? this.authDto,
      error: error ?? this.error,
    );
  }
}

sealed class AuthState extends Equatable {
  final AuthStateData data;
  const AuthState(this.data);

  @override
  List<Object> get props => [data];
}

final class AuthInitial extends AuthState {
  const AuthInitial() : super(const AuthStateData());
}

final class AuthLoading extends AuthState {
  const AuthLoading(super.data);
}

final class AuthFailure extends AuthState {
  const AuthFailure(super.data);
}

final class AuthLoaded extends AuthState {
  const AuthLoaded(super.data);
}

final class AuthActivation extends AuthState {
  const AuthActivation(super.data);
}
