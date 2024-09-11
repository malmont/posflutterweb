import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const CarouselIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: itemCount,
      effect: const WormEffect(
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: Colors.blueAccent,
      ),
    );
  }
}
