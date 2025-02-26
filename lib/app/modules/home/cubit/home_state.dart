part of 'home_cubit.dart';

class HomeStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final Meta? meta;
  final BaseResponseFailure? error;

  const HomeStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.meta,
    this.error,
  });

  @override
  List<Object?> get props => [isLoading, isLoaded, meta, error];

  HomeStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    Meta? meta,
    BaseResponseFailure? error,
  }) {
    return HomeStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      meta: meta ?? this.meta,
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
