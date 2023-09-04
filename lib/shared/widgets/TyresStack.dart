import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TyresStack extends StatelessWidget {
  const TyresStack({
    super.key, required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Positioned(right: constraints.maxWidth*.24,top: constraints.maxHeight*.15,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),
        Positioned(left: constraints.maxWidth*.24,top: constraints.maxHeight*.15,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),
        Positioned(right: constraints.maxWidth*.24,bottom: constraints.maxHeight*.15,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),
        Positioned(left: constraints.maxWidth*.24,bottom: constraints.maxHeight*.15,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),],
    );
  }
}
