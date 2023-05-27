part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  final Auth authData;

  const AuthInitial(this.authData);

  @override
  List<Object> get props => [authData];
}

class AuthFailure extends AuthState {}

class AuthSuccess extends AuthState {
  final Auth authData;

  const AuthSuccess(this.authData);

  @override
  List<Object> get props => [authData];
}

class AuthLoading extends AuthState {}

class AuthRegister extends AuthState {}
