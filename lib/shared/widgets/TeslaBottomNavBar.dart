import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/screens/home/cubit/home_cubit.dart';
import 'package:tesla/shared/styles/assets.dart';
import '../styles/colors.dart';

class TeslaBottomNavBar extends StatelessWidget {
  const TeslaBottomNavBar({
    super.key,
    required this.selectedNavIndex,
    required this.batteryAnimationController, required this.carAnimationController, required this.tyreAnimationController,
  });

  final List<String> bottomNavIcons = const [
    Assets.lock,
    Assets.charge,
    Assets.temp,
    Assets.tyre
  ];
  final AnimationController batteryAnimationController;
  final AnimationController carAnimationController;
  final AnimationController tyreAnimationController;
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
        onTap: (value)async {
          if(value ==1)
            {
              batteryAnimationController.forward();}
          else if(value!=1&&HomeCubit.get(context).selectedBottomNavBar==1)
            {batteryAnimationController.reverse(from: 0.6);}
          if(value==2)
            {
              carAnimationController.forward();
            }
          else if(HomeCubit.get(context).selectedBottomNavBar==2 &&value!=2)
            {
              carAnimationController.reverse(from: 0.4);
            }
          if(value==3)
          {
            tyreAnimationController.forward();
            HomeCubit.get(context).changeTyresVisibilityState(value);
          }
          else if(HomeCubit.get(context).selectedBottomNavBar==3 &&value!=3)
          {
            tyreAnimationController.reverse(from: 0.5).then((_) {
              HomeCubit.get(context).changeTyresVisibilityState(value);
            });
          }
          HomeCubit.get(context).changeBottomNavBar(value);

        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed);
  }
}
