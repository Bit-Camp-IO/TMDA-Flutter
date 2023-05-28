import 'package:equatable/equatable.dart';

class Auth extends Equatable{
  final String? requestToken;
  final String? sessionId;
  final bool? requestSuccess;

  const Auth({this.requestToken, this.sessionId, this.requestSuccess});
  
  @override
  List<Object?> get props => [requestSuccess, requestToken, sessionId];

}