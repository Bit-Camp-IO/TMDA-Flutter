// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/usecases/check_user_login_session_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  UserLoginUseCase userLoginUseCase;
  CheckUserLoginSessionUseCase checkUserLoggedInUseCase;
  UserRegisterUseCase userRegisterUseCase;
  AuthCubit(
    this.userLoginUseCase,
    this.checkUserLoggedInUseCase,
    this.userRegisterUseCase,
  ) : super(AuthInitialState());

  Future<void> userLogin(String username, String password) async{
    emit(AuthLoadingState());
    final response = await userLoginUseCase(username, password);
    debugPrint('bloc response>>>>> $response');
    response.fold((l) => emit(AuthFailureState()), (r) => emit(AuthenticationState(r)));
  }

  Future<void> checkUserLoggedIn() async{
    final response = await checkUserLoggedInUseCase();
    debugPrint('bloc response>>>>> $response');
    response.fold((l) => emit(AuthFailureState()), (r) => emit(AuthenticationState(r)));
  }

  Future<void> userRegister() async{
    final response = await userRegisterUseCase();
    response.fold((l) => emit(AuthFailureState()), (r) => emit(AuthRegisterState()));
  }
}
