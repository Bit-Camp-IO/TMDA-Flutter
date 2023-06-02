import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tmda/core/util/color_manager.dart';

class CustomAnimatedIndicator extends StatelessWidget {
  const CustomAnimatedIndicator({
    super.key,
    required this.currentIndex,
    required this.dotsCount, required this.axisDirection,
  });

  final int currentIndex;
  final int dotsCount;
  final Axis axisDirection;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      count: dotsCount,
      activeIndex: currentIndex,
      axisDirection: axisDirection,
      effect: const ExpandingDotsEffect(
        spacing: 8.0,
        radius: 10.0,
        dotWidth: 10.0,
        dotHeight: 10.0,
        dotColor: Colors.white,
        activeDotColor: ColorsManager.primaryColor,
      ),
    );
  }
}
