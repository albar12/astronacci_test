part of 'profile_cubit.dart';

class ProfileStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isLogout;
  final bool updateSuccess;
  final User? user;
  final BaseResponseFailure? error;

  const ProfileStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.isLogout = false,
    this.updateSuccess = false,
    this.user,
    this.error,
  });

  @override
  List<Object?> get props => [isLoading, isLoaded, isLogout, user, error];

  ProfileStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isLogout,
    bool? updateSuccess,
    bool? removeSuccess,
    User? user,
    BaseResponseFailure? error,
  }) {
    return ProfileStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isLogout: isLogout ?? this.isLogout,
      updateSuccess: updateSuccess ?? this.updateSuccess,
      user: user ?? this.user,
      error: error ?? error,
    );
  }
}

sealed class ProfileState extends Equatable {
  final ProfileStateData data;
  const ProfileState(this.data);

  @override
  List<Object> get props => [data];
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial() : super(const ProfileStateData());
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading(super.data);
}

final class ProfileFailure extends ProfileState {
  const ProfileFailure(super.data);
}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded(super.data);
}
