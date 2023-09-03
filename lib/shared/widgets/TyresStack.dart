import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TyresStack extends StatelessWidget {
  const TyresStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Positioned(right: 110,top: 150,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),
        Positioned(left: 110,top: 150,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),
        Positioned(right: 110,bottom: 150,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),
        Positioned(left: 110,bottom: 150,child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),),],
    );
  }
}
