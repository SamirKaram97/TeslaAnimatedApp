import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/screens/home/cubit/home_cubit.dart';

import '../styles/colors.dart';

class TeslaBottomNavBar extends StatelessWidget {
  const TeslaBottomNavBar({
    super.key,
    required this.bottomNavIcons,
    required this.selectedNavIndex,
    required this.animationController,
  });

  final List<String> bottomNavIcons;
  final AnimationController animationController;
  final int selectedNavIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedNavIndex,
        items: List.generate(
            bottomNavIcons.length,
            (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    color: index == selectedNavIndex
                        ? AppColors.primaryColor
                        : AppColors.white45,
                    bottomNavIcons[index]),
                label: "")),
        onTap: (value) {
          if(value ==1)
            {
              animationController.forward();}
          else if(value!=1&&HomeCubit.get(context).selectedBottomNavBar==1)
            {animationController.reverse(from: 0.7);}
          HomeCubit.get(context).changeBottomNavBar(value);
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed);
  }
}
