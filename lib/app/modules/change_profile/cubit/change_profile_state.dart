part of 'change_profile_cubit.dart';

class ChangeProfileStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isUpdated;
  final bool removeSuccess;
  final List<UniversityModel>? dataUniversity;
  final BaseResponseFailure? error;

  const ChangeProfileStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.isUpdated = false,
    this.removeSuccess = false,
    this.dataUniversity,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        isUpdated,
        removeSuccess,
        dataUniversity,
        error,
      ];

  ChangeProfileStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isUpdated,
    bool? removeSuccess,
    List<UniversityModel>? dataUniversity,
    BaseResponseFailure? error,
  }) {
    return ChangeProfileStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isUpdated: isUpdated ?? this.isUpdated,
      removeSuccess: removeSuccess ?? this.removeSuccess,
      dataUniversity: dataUniversity ?? this.dataUniversity,
      error: error ?? error,
    );
  }
}

sealed class ChangeProfileState extends Equatable {
  final ChangeProfileStateData data;
  const ChangeProfileState(this.data);

  @override
  List<Object> get props => [data];
}

final class ChangeProfileInitial extends ChangeProfileState {
  const ChangeProfileInitial() : super(const ChangeProfileStateData());
}

final class ChangeProfileLoading extends ChangeProfileState {
  const ChangeProfileLoading(super.data);
}

final class ChangeProfileFailure extends ChangeProfileState {
  const ChangeProfileFailure(super.data);
}

final class ChangeProfileLoaded extends ChangeProfileState {
  const ChangeProfileLoaded(super.data);
}
