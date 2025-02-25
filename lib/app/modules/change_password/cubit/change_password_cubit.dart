import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  var stateData = const ChangePasswordStateData();
  final ProfileRepository profileRepository;
  ChangePasswordCubit(
    this.profileRepository,
  ) : super(const ChangePasswordInitial());

  Future<void> changePassword(ChangePasswordRequestDto dto) async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
    );
    emit(ChangePasswordLoading(stateData));

    final result = await profileRepository.changePassword(dto);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(ChangePasswordFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          isSuccess: true,
        );
        emit(ChangePasswordLoaded(stateData));
      },
    );
  }
}
