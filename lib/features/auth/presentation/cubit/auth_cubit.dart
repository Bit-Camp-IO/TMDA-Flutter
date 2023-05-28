// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/usecases/check_user_loging_session_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  UserLoginUseCase userLoginUseCase;
  CheckUserLoginSessionUseCase checkUserLoggedInUseCase;
  UserRegisterUseCase userRegisterUseCase;
  late Auth authData;
  AuthCubit(
    this.userLoginUseCase,
    this.checkUserLoggedInUseCase,
    this.userRegisterUseCase,
    this.authData,
  ) : super(AuthInitial(authData));

  Future<void> userLogin(String username, String password) async{
    emit(AuthLoading());
    final response = await userLoginUseCase(username, password);
    debugPrint('bloc response>>>>> $response');
    response.fold((l) => emit(AuthFailure()), (r) => emit(AuthSuccess(r)));
  }

  Future<void> checkUserLoggedIn() async{
    emit(AuthLoading());
    final response = await checkUserLoggedInUseCase();
    debugPrint('bloc response>>>>> $response');
    response.fold((l) => emit(AuthFailure()), (r) => emit(AuthSuccess(r)));
  }

  Future<void> userRegister() async{
    final response = await userRegisterUseCase();
    response.fold((l) => emit(AuthFailure()), (r) => emit(AuthRegister()));
  }
}
