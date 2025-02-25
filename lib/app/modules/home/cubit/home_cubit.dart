import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/path.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AuthRepository authRepository;

  var stateData = const HomeStateData();

  HomeCubit(this.authRepository) : super(const HomeInitial());
}
