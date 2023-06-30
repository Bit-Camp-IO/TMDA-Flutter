import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/neon_profile_picture.dart';
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 400.ms)],
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
            return Row(
              children: [
                const Spacer(flex: 1),
                NeonProfilePicture(imagePath: state.account.accountAvatar.path, errorImagePath: AssetsManager.neonAvatar),
                const Spacer(flex: 1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.account.name.isEmpty
                          ? StringsManager.noAccountName
                          : state.account.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '@${state.account.username}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
                IconButton(
                    onPressed: () {
                      context.read<AccountBloc>().add(AccountLogoutEvent());
                    },
                    icon: const Icon(SolarSystemIcons.sign_out,
                        color: Colors.white, size: 30)),
                const Spacer(flex: 1),
              ],
            );
        },
      ),
    );
  }
}
