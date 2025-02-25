import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  final AuthRepository authRepository;
  var stateData = const BookDetailStateData();
  BookDetailCubit(this.authRepository) : super(const BookDetailInitial());
}
