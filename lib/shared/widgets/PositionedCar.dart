
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/assets.dart';

class PositionedCar extends StatelessWidget {
  const PositionedCar({
    super.key,
    required this.shiftCarAnimation, required this.constraints,
  });

  final Animation<double> shiftCarAnimation;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (constraints.maxWidth / 2) * shiftCarAnimation.value,
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * 0.1),
        child: SvgPicture.asset(
          Assets.car,
          width: double.infinity,
        ),
      ),
    );
  }
}

