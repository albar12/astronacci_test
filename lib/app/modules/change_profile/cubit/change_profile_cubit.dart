import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'change_profile_state.dart';

class ChangeProfileCubit extends Cubit<ChangeProfileState> {
  final ProfileRepository profileRepository;
  var stateData = const ChangeProfileStateData();
  ChangeProfileCubit(
    this.profileRepository,
  ) : super(const ChangeProfileInitial());

  Future<void> getProgramStudy() async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
      isUpdated: false,
      removeSuccess: false,
    );
    emit(ChangeProfileLoading(stateData));

    final result = await profileRepository.getProgramStudy();
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(ChangeProfileFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          dataUniversity: right,
        );
        emit(ChangeProfileLoaded(stateData));
      },
    );
  }

  Future<void> changeProfile(ChangeProfileRequestDto dto) async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
    );
    emit(ChangeProfileLoading(stateData));

    final result = await profileRepository.updateProfile(dto);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(ChangeProfileFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          isUpdated: true,
        );
        emit(ChangeProfileLoaded(stateData));
      },
    );
  }
}
