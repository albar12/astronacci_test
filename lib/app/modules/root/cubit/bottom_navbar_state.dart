part of 'bottom_navbar_cubit.dart';

sealed class BottomNavbarState extends Equatable {
  const BottomNavbarState();

  @override
  List<Object> get props => [];
}

final class BottomNavbarInitial extends BottomNavbarState {}

final class BottomNavbarChanged<T> extends BottomNavbarState {
  final int index;
  final T? arguments;

  const BottomNavbarChanged({
    required this.index,
    this.arguments,
  });

  @override
  List<Object> get props => [index, if (arguments != null) arguments!];
}
