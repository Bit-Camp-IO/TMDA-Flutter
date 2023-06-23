import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Divider(
        color: Colors.white.withOpacity(0.8),
        thickness: 1,
        indent: 20,
        endIndent: 30,
      ),
    );
  }
}
