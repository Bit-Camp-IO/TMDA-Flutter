import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white.withOpacity(0.8),
      thickness: 1,
      indent: 50,
      endIndent: 50,
    );
  }
}
