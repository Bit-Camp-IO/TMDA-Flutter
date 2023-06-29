import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Row(
          children: [
            const Spacer(flex: 1),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  ColorsManager.secondaryColor,
                  ColorsManager.primaryColor
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0).r,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: _buildProfileImage(
                            state.account.accountAvatar.avatarPath)),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.account.name.isEmpty ? 'No Account Name' : state.account.name,
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
              icon: const Icon(SolarSystemIcons.signout, color: Colors.white, size: 30)
            ),
            const Spacer(flex: 1),
          ],
        );
      },
    );
  }
  ImageProvider _buildProfileImage(String image) {
    if (image.isEmpty) {
      return const AssetImage(AssetsManager.neonAvatar);
    } else {
      return CachedNetworkImageProvider(
        ApiConstants.imageUrl(
          image,
        ),
      );
    }
  }
}
