// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthFailureState extends AuthState {}

class UnAuthenticatedState extends AuthState {}

class AuthenticationState extends AuthState {
  final Auth authData;

  const AuthenticationState(this.authData);

  @override
  List<Object> get props => [authData];
}

class AuthLoadingState extends AuthState {}

class AuthRegisterState extends AuthState {}


class ObscuredState extends AuthState {
  final bool isObscured;
  const ObscuredState({
    this.isObscured = true,
  });

@override
  List<Object> get props => [isObscured];

}
