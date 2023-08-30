import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/screens/home/cubit/home_states.dart';
import 'package:tesla/shared/styles/assets.dart';
import 'package:tesla/shared/styles/colors.dart';
import 'package:tesla/shared/widgets/DoorLock.dart';

import '../../shared/widgets/TeslaBottomNavBar.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> bottomNavIcons = const [
    Assets.lock,
    Assets.charge,
    Assets.temp,
    Assets.tyre
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SvgPicture.asset(
                        Assets.car,
                        width: double.infinity,
                      ),
                      Positioned(
                        right: constraints.maxWidth * 0.05,
                        child: DoorLock(
                          onTap: () => homeCubit.changeDoorLockState('r'),
                          isOpened: homeCubit.doors['r']!,
                        ),
                      ),
                      Positioned(
                        left: constraints.maxWidth * 0.05,
                        child: DoorLock(
                          onTap: () => homeCubit.changeDoorLockState('l'),
                          isOpened: homeCubit.doors['l']!,
                        ),
                      ),
                      Positioned(
                        top: constraints.maxWidth * 0.15,
                        child: DoorLock(
                          onTap: () => homeCubit.changeDoorLockState('t'),
                          isOpened: homeCubit.doors['t']!,
                        ),
                      ),
                      Positioned(
                        bottom: constraints.maxWidth * 0.15,
                        child: DoorLock(
                          onTap: () => homeCubit.changeDoorLockState('b'),
                          isOpened: homeCubit.doors['b']!,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: TeslaBottomNavBar(
                bottomNavIcons: bottomNavIcons,
                selectedNavIndex: homeCubit.selectedBottomNavBar),
          );
        },
      ),
    );
  }
}
