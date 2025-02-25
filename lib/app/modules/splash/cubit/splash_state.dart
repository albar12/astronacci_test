part of 'splash_cubit.dart';

class SplashStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isGetProfileSuccess;
  final bool refreshTokenSuccess;
  final bool? isLogin;
  final BaseResponseFailure? error;

  const SplashStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.isGetProfileSuccess = false,
    this.refreshTokenSuccess = false,
    this.isLogin,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        isGetProfileSuccess,
        refreshTokenSuccess,
        isLogin,
        error,
      ];

  SplashStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isGetProfileSuccess,
    bool? refreshTokenSuccess,
    bool? isLogin,
    BaseResponseFailure? error,
  }) {
    return SplashStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isGetProfileSuccess: isGetProfileSuccess ?? this.isGetProfileSuccess,
      refreshTokenSuccess: refreshTokenSuccess ?? this.refreshTokenSuccess,
      isLogin: isLogin ?? this.isLogin,
      error: error ?? error,
    );
  }
}

sealed class SplashState extends Equatable {
  final SplashStateData data;
  const SplashState(this.data);

  @override
  List<Object> get props => [data];
}

final class SplashInitial extends SplashState {
  const SplashInitial() : super(const SplashStateData());
}

final class SplashLoading extends SplashState {
  const SplashLoading(super.data);
}

final class SplashError extends SplashState {
  const SplashError(super.data);
}

final class SplashLoaded extends SplashState {
  const SplashLoaded(super.data);
}
