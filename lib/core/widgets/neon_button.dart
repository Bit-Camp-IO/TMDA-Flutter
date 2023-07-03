import 'package:flutter/material.dart';
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
          width: 180,
          height: 48,
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
