import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_state.dart';

class TvCubit extends Cubit<TvState> {
  TvCubit() : super(TvInitial());
}
