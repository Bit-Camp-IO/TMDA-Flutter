part of 'actor_cubit.dart';

abstract class ActorState extends Equatable {
  const ActorState();

  @override
  List<Object> get props => [];
}

class ActorInitial extends ActorState {}
