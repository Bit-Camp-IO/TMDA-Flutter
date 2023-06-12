part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginFailState extends LoginState {
  final String failMessage;

  const LoginFailState(this.failMessage);
}

class LoginSuccessState extends LoginState {
  final Auth authData;

  const LoginSuccessState(this.authData);

  @override
  List<Object> get props => [authData];
}

class LoginLoadingState extends LoginState {}

class ObscuredState extends LoginState {
  final bool isObscured;
  const ObscuredState({
    this.isObscured = true,
  });

@override
  List<Object> get props => [isObscured];

}
