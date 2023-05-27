import 'package:equatable/equatable.dart';

class Auth extends Equatable{
  final String? username;
  final String? password;
  final String? requestToken;
  final String? sessionId;
  final bool? requestSuccess;

  const Auth({this.username, this.password, this.requestToken, this.sessionId, this.requestSuccess});
  
  @override
  List<Object?> get props => [username, password, requestToken, sessionId];

}