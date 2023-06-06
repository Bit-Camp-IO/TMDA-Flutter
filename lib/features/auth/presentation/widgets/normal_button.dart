import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
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
      child: Container(
        width: 180,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF007373),
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
