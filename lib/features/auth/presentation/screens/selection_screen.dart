import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/widgets/neon_button.dart';
import 'package:tmda/features/auth/presentation/widgets/normal_button.dart';

@RoutePage()
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Image.asset(AssetsManager.appLogo),
                  const Spacer(flex: 1),
                  Text(
                    StringsManager.appOverview,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(flex: 1),
                  NeonButton(
                    onTap: () {
                      context.pushRoute(const LoginRoute());
                    },
                    child: Text(
                      StringsManager.login,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  NormalButton(
                    width: 180,
                    height: 48,
                    onTap: () async {
                      await BlocProvider.of<AuthCubit>(context).userRegister();
                    },
                    child: Text(
                      StringsManager.register,
                      style: Theme.of(context).textTheme.titleLarge,
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
  }
}
