import 'dart:math';
import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final bool isFront;

  const FlipCard({
    super.key,
    required this.front,
    required this.back,
    this.isFront = true,
  });

  @override
  FlipCardState createState() => FlipCardState();
}

class FlipCardState extends State<FlipCard> {
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _isFront = widget.isFront;
  }

  @override
  void didUpdateWidget(FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFront != widget.isFront) {
      setState(() {
        _isFront = widget.isFront;
      });
    }
  }

  void flipCard() {
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
        return AnimatedBuilder(
          animation: rotateAnim,
          child: child,
          builder: (context, child) {
            final isUnder = (ValueKey(_isFront) != child!.key);
            final value = isUnder ? pi - rotateAnim.value : rotateAnim.value;
            return Transform(
              transform: Matrix4.rotationY(value),
              alignment: Alignment.center,
              child: child,
            );
          },
        );
      },
      layoutBuilder: (widget, list) => Stack(
        children: [widget!, ...list],
      ),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: _isFront
          ? Container(
              key: const ValueKey(true),
              child: widget.front,
            )
          : Container(
              key: const ValueKey(false),
              child: widget.back,
            ),
    );
  }
}
