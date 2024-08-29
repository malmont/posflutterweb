import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

class AnimatedWave extends StatelessWidget {
  const AnimatedWave({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> primaryColors =  [
      Color(0xFF393C49),
      Color(0xFF393C49),
     // Colors.grey,
    ];
    List<Color> secondaryColors =  [
      //Colors.grey,
      const Color(0xffEA7C69).withOpacity(0.7),
      Color(0xFF393C49),
    ];
    return AnimateGradient(
      primaryColors: primaryColors,
      secondaryColors: secondaryColors,
      primaryBeginGeometry: const AlignmentDirectional(0, 1),
      primaryEndGeometry: const AlignmentDirectional(0, 0),
      secondaryBeginGeometry: const AlignmentDirectional(1, 0),
      secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
      duration: const Duration(seconds: 4),
      textDirectionForGeometry: TextDirection.rtl,
    );
  }
}
