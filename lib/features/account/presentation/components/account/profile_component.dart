import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/neon_profile_picture.dart';
import 'package:tmda/features/account/presentation/bloc/account_cubit/account_bloc.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeAnimation(
      duration: Duration(milliseconds: 400),
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          return Row(
            children: [
              const Spacer(flex: 1),
              NeonProfilePicture(
                imagePath: state.account.accountAvatar.path,
                errorImagePath: AssetsManager.neonAvatar,
              ),
              const Spacer(flex: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.account.name.isEmpty
                        ? context.tr.noAccountName
                        : state.account.name,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyLarge,
                  ),
                  Text(
                    '@${state.account.username}',
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              const Spacer(flex: 1),
              IconButton(
                onPressed: () {
                  context.read<AccountCubit>().accountLogout();
                },
                icon: Icon(
                  SolarSystemIcons.sign_out,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              const Spacer(flex: 1),
            ],
          );
        },
      ),
    );
  }
}
