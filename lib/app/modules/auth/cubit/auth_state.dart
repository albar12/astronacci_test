part of 'auth_cubit.dart';

class AuthStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool successLogin;
  final bool isLogin;
  final User? user;
  final AuthRequestDto? authDto;
  final BaseResponseFailure? error;

  const AuthStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.successLogin = false,
    this.isLogin = false,
    this.user,
    this.authDto,
    this.error,
  });

  @override
  List<Object?> get props => [
    isLoading,
    isLoaded,
    successLogin,
    isLogin,
    user,
    authDto,
    error,
  ];

  AuthStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? successLogin,
    bool? isLogin,
    User? user,
    AuthRequestDto? authDto,
    BaseResponseFailure? error,
  }) {
    return AuthStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      successLogin: successLogin ?? this.successLogin,
      isLogin: isLogin ?? this.isLogin,
      user: user ?? this.user,
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
