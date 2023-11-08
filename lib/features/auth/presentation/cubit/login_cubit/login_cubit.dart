import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/usecases/user_forget_password_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  UserRegisterUseCase userRegisterUseCase;
  UserForgetPasswordUseCase userForgetPasswordUseCase;
  UserLoginUseCase userLoginUseCase;
  LoginCubit({
    required this.userRegisterUseCase,
    required this.userForgetPasswordUseCase,
    required this.userLoginUseCase,
  }) : super(LoginInitial());

  Future<void> userLogin(String username, String password) async {
    emit(LoginLoadingState());
    final response = await userLoginUseCase(username, password);
    response.fold(
      (loginFail) => emit(LoginFailState(loginFail.message)),
      (loginSuccess) => loginSuccess.requestSuccess!
          ? emit(LoginSuccessState(loginSuccess))
          : emit(LoginFailState(loginSuccess.statusMessage!)),
    );
  }

  Future<void> userRegister() async {
    await userRegisterUseCase();
  }

  Future<void> userForgetPassword() async {
    await userForgetPasswordUseCase();
  }

  void changeObscuredField(bool isObscured) {
    emit(ObscuredState(isObscured: isObscured));
  }
}
