import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/features/shared/domain/entities/auth.dart';
import 'package:tmda/features/shared/domain/usecases/check_user_login_session_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';

part 'local_state.dart';

@injectable
class LocalCubit extends Cubit<AuthState> {
  CheckUserLoginSessionUseCase checkUserLoggedInUseCase;
  UserRegisterUseCase userRegisterUseCase;

  LocalCubit({
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
