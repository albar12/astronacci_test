import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class AppProviders {
  static List<BlocProvider> providers = [
    BlocProvider<SplashCubit>(
      create:
          (context) => SplashCubit(
            di.get<ProfileRepository>(
              param1: di.get<ProfileRemoteDatasource>(),
              param2: di.get<AuthLocalDatasource>(
                param1: di.get<BaseStorage>(),
              ),
            ),
            di.get<AuthRepository>(
              param1: di.get<AuthRemoteDatasource>(),
              param2: di.get<AuthLocalDatasource>(
                param1: di.get<BaseStorage>(),
              ),
            ),
          ),
    ),
    BlocProvider<ForgotPasswordCubit>(
      create:
          (context) => ForgotPasswordCubit(
            di.get<AuthRepository>(
              param1: di.get<AuthRemoteDatasource>(),
              param2: di.get<AuthLocalDatasource>(
                param1: di.get<BaseStorage>(),
              ),
            ),
          ),
    ),
    BlocProvider<SignUpCubit>(
      create:
          (context) => SignUpCubit(
            di.get<AuthRepository>(
              param1: di.get<AuthRemoteDatasource>(),
              param2: di.get<AuthLocalDatasource>(
                param1: di.get<BaseStorage>(),
              ),
            ),
          ),
    ),
  ];
}
