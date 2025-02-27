import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/path.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AuthRepository authRepository;

  var stateData = const HomeStateData();

  HomeCubit(this.authRepository) : super(const HomeInitial());

  Future<void> getListUsers(UsersRequestDto dto) async {
    stateData = stateData.copyWith(
      isLoading: true,
      isLoaded: false,
      successGetlist: false,
      users: [],
    );
    emit(HomeLoading(stateData));

    final result = await authRepository.getListUsers(dto);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(HomeFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          currentPage: right.currentPage,
          users: right.data,
          perPage: dto.perPage,
          enablePullUp: true,
          successGetlist: true,
          successLoadlist: false,
        );
        emit(HomeLoaded(stateData));
      },
    );
  }

  Future<void> loadListUsers(UsersRequestDto dto) async {
    final result = await authRepository.getListUsers(dto);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(HomeFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          currentPage: right.currentPage,
          users: stateData.users!..addAll(right.data),
          perPage: dto.perPage,
          enablePullUp: right.data.isNotEmpty ? true : false,
          successLoadlist: true,
          successGetlist: false,
        );
        emit(HomeLoaded(stateData));
      },
    );
  }

  Future<void> searchUsers(UsersRequestDto dto) async {
    final result = await authRepository.getListUsers(dto);
    result.fold(
      (left) {
        stateData = stateData.copyWith(error: left);
        emit(HomeFailure(stateData));
      },
      (right) {
        stateData = stateData.copyWith(
          isLoaded: true,
          isLoading: false,
          currentPage: right.currentPage,
          users: right.data,
          perPage: dto.perPage,
          enablePullUp: true,
          successGetlist: true,
          successLoadlist: false,
        );
        emit(HomeLoaded(stateData));
      },
    );
  }
}
