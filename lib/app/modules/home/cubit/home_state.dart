part of 'home_cubit.dart';

class HomeStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool successGetlist;
  final bool successLoadlist;
  final bool? enablePullUp;
  final int? currentPage;
  final int? perPage;
  final Meta? meta;
  final List<User>? users;
  final BaseResponseFailure? error;

  const HomeStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.successGetlist = false,
    this.successLoadlist = false,
    this.enablePullUp,
    this.currentPage,
    this.perPage,
    this.meta,
    this.users,
    this.error,
  });

  @override
  List<Object?> get props => [
    isLoading,
    isLoaded,
    successGetlist,
    successLoadlist,
    enablePullUp,
    currentPage,
    perPage,
    meta,
    users,
    error,
  ];

  HomeStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? successGetlist,
    bool? successLoadlist,
    bool? enablePullUp,
    int? currentPage,
    int? perPage,
    Meta? meta,
    List<User>? users,
    BaseResponseFailure? error,
  }) {
    return HomeStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      successGetlist: successGetlist ?? this.successGetlist,
      successLoadlist: successLoadlist ?? this.successLoadlist,
      enablePullUp: enablePullUp ?? this.enablePullUp,
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
      meta: meta ?? this.meta,
      users: users ?? this.users,
      error: error ?? error,
    );
  }
}

sealed class HomeState extends Equatable {
  final HomeStateData data;
  const HomeState(this.data);

  @override
  List<Object> get props => [data];
}

final class HomeInitial extends HomeState {
  const HomeInitial() : super(const HomeStateData());
}

final class HomeLoading extends HomeState {
  const HomeLoading(super.data);
}

final class HomeFailure extends HomeState {
  const HomeFailure(super.data);
}

final class HomeLoaded extends HomeState {
  const HomeLoaded(super.data);
}

final class HomeReset extends HomeState {
  const HomeReset(super.data);
}

final class HomeGetFreeBook extends HomeState {
  const HomeGetFreeBook(super.data);
}
