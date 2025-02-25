part of 'book_detail_cubit.dart';

class BookDetailStateData extends Equatable {
  final bool isLoading;
  final bool isLoaded;
  final bool isDownloading;
  final bool? isFree;
  final bool getBookOrder;
  final bool claimSuccess;
  final bool getBookListSuccess;
  final bool isMarking;
  final bool download;
  final bool isCheckDuration;
  final bool checkingDuration;
  final bool deleteBookSuccess;
  final bool? fromLocal;
  final bool? updateSuccess;
  final bool? isFromBookDetail;
  final int? progress;
  final Meta? meta;
  final BaseResponseFailure? error;

  const BookDetailStateData({
    this.isLoading = false,
    this.isLoaded = false,
    this.isDownloading = false,
    this.isFree,
    this.getBookOrder = false,
    this.claimSuccess = false,
    this.getBookListSuccess = false,
    this.download = false,
    this.isCheckDuration = false,
    this.deleteBookSuccess = false,
    this.checkingDuration = false,
    this.isMarking = false,
    this.isFromBookDetail,
    this.fromLocal,
    this.updateSuccess,
    this.progress,
    this.meta,
    this.error,
  });

  @override
  List<Object?> get props => [
    isLoading,
    isLoaded,
    isDownloading,
    isFree,
    getBookOrder,
    claimSuccess,
    getBookListSuccess,
    isMarking,
    isFromBookDetail,
    download,
    isCheckDuration,
    checkingDuration,
    deleteBookSuccess,
    fromLocal,
    updateSuccess,
    progress,
    meta,
    error,
  ];

  BookDetailStateData copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isDownloading,
    bool? isFree,
    bool? getBookOrder,
    bool? claimSuccess,
    bool? getBookListSuccess,
    bool? isMarking,
    bool? isFromBookDetail,
    bool? fromLocal,
    bool? updateSuccess,
    bool? download,
    bool? isCheckDuration,
    bool? deleteBookSuccess,
    bool? checkingDuration,
    int? progress,
    Meta? meta,
    BaseResponseFailure? error,
  }) {
    return BookDetailStateData(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isDownloading: isDownloading ?? this.isDownloading,
      isFree: isFree ?? this.isFree,
      getBookOrder: getBookOrder ?? this.getBookOrder,
      claimSuccess: claimSuccess ?? this.claimSuccess,
      getBookListSuccess: getBookListSuccess ?? this.getBookListSuccess,
      isMarking: isMarking ?? this.isMarking,
      isFromBookDetail: isFromBookDetail ?? this.isFromBookDetail,
      fromLocal: fromLocal ?? this.fromLocal,
      updateSuccess: updateSuccess ?? this.updateSuccess,
      download: download ?? this.download,
      isCheckDuration: isCheckDuration ?? this.isCheckDuration,
      deleteBookSuccess: deleteBookSuccess ?? this.deleteBookSuccess,
      checkingDuration: checkingDuration ?? this.checkingDuration,
      progress: progress ?? this.progress,
      meta: meta ?? this.meta,
      error: error ?? error,
    );
  }
}

sealed class BookDetailState extends Equatable {
  final BookDetailStateData data;
  const BookDetailState(this.data);

  @override
  List<Object> get props => [data];
}

final class BookDetailInitial extends BookDetailState {
  const BookDetailInitial() : super(const BookDetailStateData());
}

final class BookDetailLoading extends BookDetailState {
  const BookDetailLoading(super.data);
}

final class BookDetailFailure extends BookDetailState {
  const BookDetailFailure(super.data);
}

final class BookDetailLoaded extends BookDetailState {
  const BookDetailLoaded(super.data);
}

final class BookDetailDownloading extends BookDetailState {
  const BookDetailDownloading(super.data);
}

final class BookDetailLocal extends BookDetailState {
  const BookDetailLocal(super.data);
}

final class BookDetailFree extends BookDetailState {
  const BookDetailFree(super.data);
}

final class BookDetailCheckingDuration extends BookDetailState {
  const BookDetailCheckingDuration(super.data);
}
