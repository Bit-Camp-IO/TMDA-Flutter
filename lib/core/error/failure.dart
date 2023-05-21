import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure{}

class ApiFailure extends Failure{}