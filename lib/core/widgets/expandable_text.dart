import 'package:flutter/material.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';

class ExpandableText extends StatelessWidget {
  const ExpandableText({
    super.key,
    required this.text,
    required this.isTextExpanded,
    required this.onPressed,
  });

  final bool isTextExpanded;
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 700),
          child: ConstrainedBox(
            constraints: isTextExpanded
                ? const BoxConstraints()
                : const BoxConstraints(maxHeight: 100),
            child: Text(
              text,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorsManager.inActiveColor,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        isTextExpanded
            ? OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: ColorsManager.primaryColor),
                ),
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                label: Text(
                  context.tr.readLess,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: onPressed,
              )
            : TextButton.icon(
                icon: const Icon(
                  Icons.arrow_downward,
                  color: ColorsManager.primaryColor,
                ),
                label: Text(
                  context.tr.readMore,
                  style: TextStyle(color: ColorsManager.primaryColor),
                ),
                onPressed: onPressed,
              ),
      ],
    );
  }
}
