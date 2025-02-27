import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  var stateData = const ProfileStateData();
  final ProfileRepository profileRepository;
  final AuthRepository authRepository;
  ProfileCubit(this.profileRepository, this.authRepository)
    : super(const ProfileInitial());

  Future<void> getProfile() async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
      isLogout: false,
    );
    emit(ProfileLoading(stateData));

    final result = await profileRepository.getProfile();
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(ProfileFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          user: right,
          updateSuccess: false,
        );
        emit(ProfileLoaded(stateData));
      },
    );
  }

  Future<void> updateProfile(ChangeProfileRequestDto request) async {
    final result = await profileRepository.updateProfile(request);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(ProfileFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          user: right,
          updateSuccess: true,
        );
        emit(ProfileLoaded(stateData));
      },
    );
  }

  Future<void> logout() async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(ProfileLoading(stateData));

    final result = await authRepository.authLogout();
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(ProfileFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          isLogout: true,
        );
        emit(ProfileLoaded(stateData));
      },
    );
  }
}
