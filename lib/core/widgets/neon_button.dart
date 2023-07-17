import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/assets_manager.dart';

class NeonButton extends StatelessWidget {
  const NeonButton({
    super.key,
    required this.onTap,
    required this.child,
  });
  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
          width: 150.w,
          height: 48.h,
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  AssetsManager.neonButton,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: child,
              )
            ],
          )),
    );
  }
}
