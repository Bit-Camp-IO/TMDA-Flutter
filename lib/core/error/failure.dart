import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String message;

  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure{
  const CacheFailure(super.message);
}

class ApiFailure extends Failure{
  const ApiFailure(super.message);
}