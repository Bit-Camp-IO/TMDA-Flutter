import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/usecases/check_user_login_session_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  CheckUserLoginSessionUseCase checkUserLoggedInUseCase;
  UserRegisterUseCase userRegisterUseCase;

  AuthCubit({
    required this.checkUserLoggedInUseCase,
    required this.userRegisterUseCase,
  }) : super(AuthInitialState());

  Future<void> checkUserLoggedIn() async {
    final response = await checkUserLoggedInUseCase();
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
    await userRegisterUseCase();
  }
}
