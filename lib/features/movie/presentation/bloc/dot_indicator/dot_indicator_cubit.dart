import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'dot_indicator_state.dart';

class DotIndicatorCubit extends Cubit<DotIndicatorState> {
  DotIndicatorCubit() : super(const DotIndicatorState(0));
  changeIndicatorIndex(int index){
    emit(DotIndicatorState(index));
  }
}
