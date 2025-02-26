import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;
  var stateData = const SignUpStateData();
  SignUpCubit(this.authRepository) : super(const SignUpInitial());

  Future<void> register(RegisterRequestDto dto) async {
    stateData = stateData.copyWith(isLoading: true, isLoaded: false);
    emit(SignUpLoading(stateData));

    final result = await authRepository.authRegister(dto);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left, registerRequestDto: dto);
        emit(SignUpFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          responseMsg: right,
          registerRequestDto: dto,
        );
        emit(SignUpLoaded(stateData));
      },
    );
  }
}
