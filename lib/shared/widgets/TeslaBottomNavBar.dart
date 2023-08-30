import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/screens/home/cubit/home_cubit.dart';

import '../styles/colors.dart';

class TeslaBottomNavBar extends StatelessWidget {
  const TeslaBottomNavBar({
    super.key,
    required this.bottomNavIcons,
    required this.selectedNavIndex,
  });

  final List<String> bottomNavIcons;
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
          HomeCubit.get(context).changeBottomNavBar(value);
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed);
  }
}
