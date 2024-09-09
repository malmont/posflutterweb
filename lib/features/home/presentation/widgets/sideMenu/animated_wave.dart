import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

import '../../../../../design/design.dart';

class AnimatedWave extends StatefulWidget {
  const AnimatedWave({super.key});

  @override
  State<AnimatedWave> createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave> {
  @override
  Widget build(BuildContext context) {
    List<Color> primaryColors = [
      Colours.primary100,
      Colours.primary100,
      // Colors.grey,
    ];
    List<Color> secondaryColors = [
      //Colors.grey,
      Colours.colorsButtonMenu.withOpacity(0.7),
      Colours.primary100,
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
