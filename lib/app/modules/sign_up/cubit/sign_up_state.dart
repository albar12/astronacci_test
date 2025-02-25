part of 'sign_up_cubit.dart';

class SignUpStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool updateSuccess;
  final bool initialRegister;
  final bool createPasswordSuccess;
  final SignUpModel? signUpModel;
  final AuthGoogle? authGoogle;
  final RegisterRequestDto? registerRequestDto;
  final InitialRegisterModel? initialRegisterModel;
  final BaseResponseFailure? error;

  const SignUpStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.updateSuccess = false,
    this.initialRegister = false,
    this.createPasswordSuccess = false,
    this.signUpModel,
    this.authGoogle,
    this.registerRequestDto,
    this.initialRegisterModel,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isLoaded,
        updateSuccess,
        initialRegister,
        createPasswordSuccess,
        signUpModel,
        authGoogle,
        registerRequestDto,
        initialRegisterModel,
        error,
      ];

  SignUpStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? updateSuccess,
    bool? initialRegister,
    bool? createPasswordSuccess,
    SignUpModel? signUpModel,
    AuthGoogle? authGoogle,
    RegisterRequestDto? registerRequestDto,
    InitialRegisterModel? initialRegisterModel,
    BaseResponseFailure? error,
  }) {
    return SignUpStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      updateSuccess: updateSuccess ?? this.updateSuccess,
      initialRegister: initialRegister ?? this.initialRegister,
      createPasswordSuccess: createPasswordSuccess ?? this.createPasswordSuccess,
      signUpModel: signUpModel ?? this.signUpModel,
      authGoogle: authGoogle ?? this.authGoogle,
      registerRequestDto: registerRequestDto ?? this.registerRequestDto,
      initialRegisterModel: initialRegisterModel ?? this.initialRegisterModel,
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
