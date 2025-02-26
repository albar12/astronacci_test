part of 'sign_up_cubit.dart';

class SignUpStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool registerSucces;
  final RegisterRequestDto? registerRequestDto;
  final ResponseMsg? responseMsg;
  final BaseResponseFailure? error;

  const SignUpStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.registerSucces = false,
    this.registerRequestDto,
    this.responseMsg,
    this.error,
  });

  @override
  List<Object?> get props => [
    isLoading,
    isLoaded,
    registerSucces,
    registerRequestDto,
    responseMsg,
    error,
  ];

  SignUpStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? registerSucces,
    RegisterRequestDto? registerRequestDto,
    ResponseMsg? responseMsg,
    BaseResponseFailure? error,
  }) {
    return SignUpStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      registerSucces: registerSucces ?? this.registerSucces,
      registerRequestDto: registerRequestDto ?? this.registerRequestDto,
      responseMsg: responseMsg ?? this.responseMsg,
      error: error ?? error,
    );
  }
}

sealed class SignUpState extends Equatable {
  final SignUpStateData data;
  const SignUpState(this.data);

  @override
  List<Object> get props => [data];
}

final class SignUpInitial extends SignUpState {
  const SignUpInitial() : super(const SignUpStateData());
}

final class SignUpLoading extends SignUpState {
  const SignUpLoading(super.data);
}

final class SignUpFailure extends SignUpState {
  const SignUpFailure(super.data);
}

final class SignUpLoaded extends SignUpState {
  const SignUpLoaded(super.data);
}
