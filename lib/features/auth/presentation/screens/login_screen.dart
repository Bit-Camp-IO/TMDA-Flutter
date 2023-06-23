import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/auth/presentation/cubit/login_cubit.dart';
import 'package:tmda/features/auth/presentation/widgets/custom_obscured_text_field.dart';
import 'package:tmda/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:tmda/features/auth/presentation/widgets/neon_button.dart';

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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          AutoRouter.of(context).replace(const MainRoutePage());
        } else if (state is LoginFailState) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failMessage),
            ),
          );
        } else if (state is ObscuredState) {
          isObscured = state.isObscured;
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
                        StringsManager.loginWelcome,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
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
                          BlocProvider.of<LoginCubit>(context)
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
                          BlocProvider.of<LoginCubit>(context)
                              .userForgetPassword();
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            StringsManager.forgetPassword,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ColorsManager.primaryColor,
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
                          await BlocProvider.of<LoginCubit>(context)
                              .userLogin(username, password);
                        },
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                StringsManager.login,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                      ),
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsManager.noAccount,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .userRegister();
                            },
                            child: Text(
                              StringsManager.registerNow,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorsManager.primaryColor,
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

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }
}
