import 'package:equatable/equatable.dart';

class Auth extends Equatable{
  final String? requestToken;
  final String? sessionId;
  final bool? requestSuccess;
  final String? statusMessage;

  const Auth({this.requestToken, this.sessionId, this.requestSuccess, this.statusMessage});
  
  @override
  List<Object?> get props => [requestSuccess, requestToken, sessionId, statusMessage];

}