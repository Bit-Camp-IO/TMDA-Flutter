import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/custom_text_form_field.dart';
import 'package:tmda/core/widgets/error_snack_bar.dart';
import 'package:tmda/core/widgets/neon_button.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: this,
    );
  }
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
          context.replaceRoute(const BottomNaviagationBarRoute());
        } else if (state is LoginFailState) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(
                errorMessage: state.failMessage.split(':').removeLast(),
                context: context),
          );
        } else if (state is ObscuredState) {
          isObscured = state.isObscured;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: NeonLightBackGround(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      context.tr.loginWelcome,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      context.tr.loginWelcome,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                    const Spacer(flex: 2),
                    CustomTextFormField(
                      textInputType: TextInputType.text,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          username = newValue;
                        }
                      },
                      hintText: context.tr.loginUserName,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      textInputType: TextInputType.text,
                      obscureText: true,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          password = newValue;
                        }
                      },
                      hintText: context.tr.loginPassword,
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<LoginCubit>().userForgetPassword();
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          context.tr.forgetPassword,
                          style: context.textTheme.bodySmall!.copyWith(
                            color: ColorsManager.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 4),
                    NeonButton(
                      onTap: () async {
                        FormState? loginData = formKey.currentState;
                        if (loginData!.validate()) {
                          loginData.save();
                        }
                        await context
                            .read<LoginCubit>()
                            .userLogin(username, password);
                      },
                      child: isLoading
                          ? Center(
                              child: Lottie.asset(
                                AssetsManager.neonLoading,
                                width: 120.w,
                                height: 40.h,
                              ),
                            )
                          : CustomFadeAnimation(
                              duration: Duration(milliseconds: 150),
                              child: Text(
                                context.tr.login,
                                style: context.textTheme.bodyLarge,
                              ),
                            ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.tr.noAccount,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: ColorsManager.inActiveColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<LoginCubit>().userRegister();
                          },
                          child: Text(
                            context.tr.registerNow,
                            style: context.textTheme.bodySmall!.copyWith(
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
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    formKey.currentState
      ?..dispose()
      ..dispose();
    super.dispose();
  }
}
