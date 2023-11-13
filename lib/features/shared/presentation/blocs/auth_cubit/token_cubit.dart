import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/features/shared/domain/entities/auth.dart';
import 'package:tmda/features/shared/domain/usecases/check_user_login_session_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';

part 'token_state.dart';

@injectable
class TokenCubit extends Cubit<AuthState> {
  final CheckUserLoginSessionUseCase _checkUserLoggedInUseCase;
  final UserRegisterUseCase _userRegisterUseCase;

  TokenCubit(
  this._checkUserLoggedInUseCase,
  this._userRegisterUseCase,
  ) : super(AuthInitialState());

  Future<void> checkUserLoggedIn() async {
    final response = await _checkUserLoggedInUseCase();

    response.fold(
      (authFailure) => emit(
        UnAuthenticatedState(),
      ),
      (authSuccess) => emit(
        AuthenticatedState(authSuccess),
      ),
    );
  }

  Future<void> userRegister() async {
    await _userRegisterUseCase();
  }

}
