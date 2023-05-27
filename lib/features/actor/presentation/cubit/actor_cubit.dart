import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'actor_state.dart';

class ActorCubit extends Cubit<ActorState> {
  ActorCubit() : super(ActorInitial());
}
