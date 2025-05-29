import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/neon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/core/widgets/normal_button.dart';
import 'package:tmda/features/shared/presentation/blocs/auth_cubit/token_cubit.dart';

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
              top: 30.h,
              left: 20.w,
              child: NeonLightPainter(
                  color: ColorsManager.primaryColor.withValues(alpha: 0.5)),
            ),
            Positioned(
              bottom: 350.h,
              right: 0,
              child: NeonLightPainter(
                  color: ColorsManager.secondaryColor.withValues(alpha: 0.5)),
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
                    context.tr.appOverview,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  const Spacer(flex: 1),
                  NeonButton(
                    onTap: () {
                      context.pushRoute(const LoginRoute());
                    },
                    child: Text(
                      context.tr.login,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  NormalButton(
                    width: 150.w,
                    height: 48.h,
                    onTap: () async {
                      await context.read<TokenCubit>().userRegister();
                    },
                    child: Text(
                      context.tr.register,
                      style: context.textTheme.bodyLarge,
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
