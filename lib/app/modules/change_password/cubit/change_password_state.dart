part of 'change_password_cubit.dart';

class ChangePasswordStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isSuccess;
  final BaseResponseFailure? error;

  const ChangePasswordStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.isSuccess = false,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        isSuccess,
        error,
      ];

  ChangePasswordStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isSuccess,
    BaseResponseFailure? error,
  }) {
    return ChangePasswordStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? error,
    );
  }
}

sealed class ChangePasswordState extends Equatable {
  final ChangePasswordStateData data;
  const ChangePasswordState(this.data);

  @override
  List<Object> get props => [data];
}

final class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial() : super(const ChangePasswordStateData(isSuccess: false));
}

final class ChangePasswordLoading extends ChangePasswordState {
  const ChangePasswordLoading(super.data);
}

final class ChangePasswordFailure extends ChangePasswordState {
  const ChangePasswordFailure(super.data);
}

final class ChangePasswordLoaded extends ChangePasswordState {
  const ChangePasswordLoaded(super.data);
}
