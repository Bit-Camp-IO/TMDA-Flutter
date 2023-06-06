import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/widget/neon_light_painter.dart';
import 'package:tmda/features/main/presentation/screens/main_screen.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/auth/presentation/widgets/neon_button.dart';
import 'package:tmda/features/auth/presentation/widgets/normal_button.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is UnAuthenticatedState) {
          return Scaffold(
            body: SizedBox.expand(
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 20,
                    child: NeonLightPainter(
                        color: ColorsManager.primaryColor.withOpacity(0.5)),
                  ),
                  Positioned(
                    bottom: 350,
                    right: 0,
                    child: NeonLightPainter(
                        color: ColorsManager.secondaryColor.withOpacity(0.5)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 4),
                        SvgPicture.asset(AssetsManager.appLogo),
                        const Spacer(flex: 1),
                        Text(
                          'Your guide to movies, TV shows\n and celebrities',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(flex: 1),
                        NeonButton(
                          onTap: () {
                            sl<AppRouter>().pushNamed('/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        NormalButton(
                          onTap: () async {
                            await BlocProvider.of<AuthCubit>(context)
                                .userRegister();
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is AuthenticationState &&
            state.authData.requestSuccess!) {
          return const MainScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
