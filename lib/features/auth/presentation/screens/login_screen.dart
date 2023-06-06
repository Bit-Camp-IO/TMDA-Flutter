import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widget/neon_light_painter.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/widgets/custom_obscured_text_field.dart';
import 'package:tmda/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:tmda/features/auth/presentation/widgets/neon_button.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  bool isLoading = false;
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          isLoading = true;
        } else if (state is AuthenticationState &&
            state.authData.requestSuccess!) {
          sl<AppRouter>().pushNamed('/');
        } else if (state is AuthenticationState &&
            !state.authData.requestSuccess!) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.authData.statusMessage!)));
        } else if (state is ObscuredState) {
          isObscured = state.isObscured;
        } else if (state is AuthFailureState) {
          debugPrint('There was a problem');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const Positioned(
                top: 30,
                left: 20,
                child: NeonLightPainter(color: ColorsManager.primaryColor),
              ),
              const Positioned(
                bottom: 350,
                right: 0,
                child: NeonLightPainter(color: ColorsManager.secondaryColor),
              ),
              const Positioned(
                bottom: 10,
                left: 10,
                child: NeonLightPainter(color: ColorsManager.primaryColor),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),
                      Text(
                        'Welcome to our\n community ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(flex: 2),
                      CustomTextField(
                        onSaved: (newValue) {
                          if (newValue != null) {
                            username = newValue;
                          }
                        },
                        hintText: StringsManager.loginUserName,
                      ),
                      SizedBox(height: 16.h),
                      CustomObscuredTextField(
                        suffixIconOnTap: () {
                          BlocProvider.of<AuthCubit>(context)
                              .changeObscuredField(!isObscured);
                        },
                        obscureText: isObscured,
                        suffixIcon: isObscured
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            password = newValue;
                          }
                        },
                        hintText: StringsManager.loginPassword,
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .userForgetPassword();
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: ColorsManager.primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 5),
                      NeonButton(
                        onTap: () async {
                          FormState? loginData = formKey.currentState;
                          if (loginData!.validate()) {
                            loginData.save();
                          }
                          await BlocProvider.of<AuthCubit>(context)
                              .userLogin(username, password);
                        },
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account? ',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context)
                                  .userRegister();
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                color: ColorsManager.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
