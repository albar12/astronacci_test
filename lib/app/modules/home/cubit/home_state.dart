part of 'home_cubit.dart';

class HomeStateData extends Equatable {
  final bool resetSuccess;
  final bool isLoading;
  final bool isLoaded;
  final bool successGetFreebook;
  final bool successGetBookList;
  final bool enablePullUp;
  final bool fromLocal;
  final bool hasBeenDisconnected;
  final bool searchIsOn;
  final bool searchIsStart;
  final bool updateRecentSuccess;
  final bool deleteRecentSuccess;
  final bool refreshTokenSuccess;
  final String? name;
  final int indexTab;
  final List<String>? tabList;
  final Meta? meta;

  final BaseResponseFailure? error;

  const HomeStateData({
    this.resetSuccess = true,
    this.isLoading = false,
    this.isLoaded = false,
    this.successGetFreebook = false,
    this.successGetBookList = false,
    this.enablePullUp = false,
    this.fromLocal = false,
    this.hasBeenDisconnected = false,
    this.searchIsOn = false,
    this.searchIsStart = false,
    this.updateRecentSuccess = false,
    this.deleteRecentSuccess = false,
    this.refreshTokenSuccess = false,
    this.indexTab = 0,
    this.name,
    this.tabList,
    this.meta,
    this.error,
  });

  @override
  List<Object?> get props => [
    resetSuccess,
    tabList,
    isLoading,
    isLoaded,
    successGetFreebook,
    successGetBookList,
    enablePullUp,
    fromLocal,
    hasBeenDisconnected,
    searchIsOn,
    searchIsStart,
    updateRecentSuccess,
    deleteRecentSuccess,
    refreshTokenSuccess,
    indexTab,
    name,
    meta,
    error,
  ];

  HomeStateData copyWith({
    bool? resetSuccess,
    List<String>? tabList,
    bool? isLoading,
    bool? isLoaded,
    bool? successGetFreebook,
    bool? successGetBookList,
    bool? enablePullUp,
    bool? fromLocal,
    bool? hasBeenDisconnected,
    bool? searchIsOn,
    bool? searchIsStart,
    bool? updateRecentSuccess,
    bool? deleteRecentSuccess,
    bool? refreshTokenSuccess,
    int? indexTab,
    String? name,
    Meta? meta,
    BaseResponseFailure? error,
  }) {
    return HomeStateData(
      resetSuccess: resetSuccess ?? this.resetSuccess,
      tabList: tabList ?? this.tabList,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      successGetFreebook: successGetFreebook ?? this.successGetFreebook,
      successGetBookList: successGetBookList ?? this.successGetBookList,
      fromLocal: fromLocal ?? this.fromLocal,
      hasBeenDisconnected: hasBeenDisconnected ?? this.hasBeenDisconnected,
      searchIsOn: searchIsOn ?? this.searchIsOn,
      searchIsStart: searchIsStart ?? this.searchIsStart,
      updateRecentSuccess: updateRecentSuccess ?? this.updateRecentSuccess,
      deleteRecentSuccess: deleteRecentSuccess ?? this.deleteRecentSuccess,
      refreshTokenSuccess: refreshTokenSuccess ?? this.refreshTokenSuccess,
      enablePullUp: enablePullUp ?? this.enablePullUp,
      indexTab: indexTab ?? this.indexTab,
      name: name ?? this.name,
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
