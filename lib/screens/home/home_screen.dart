import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/screens/home/cubit/home_states.dart';
import 'package:tesla/shared/constants.dart';
import 'package:tesla/shared/styles/assets.dart';
import 'package:tesla/shared/styles/colors.dart';
import 'package:tesla/shared/widgets/DoorLock.dart';

import '../../shared/widgets/BatteryState.dart';
import '../../shared/widgets/TeslaBottomNavBar.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  final List<String> bottomNavIcons = const [
    Assets.lock,
    Assets.charge,
    Assets.temp,
    Assets.tyre
  ];
  late AnimationController batteryAnimatedController;
  late Animation<double> batteryAnimation;
  late AnimationController batteryStateController;
  late Animation<double> batterStateAnimation;





  void initAnimation() {
    batteryAnimatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    batteryAnimation = CurvedAnimation(
        parent: batteryAnimatedController, curve: const Interval(0, 0.5));
    batteryStateController= AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    batterStateAnimation=CurvedAnimation(
        parent: batteryAnimatedController, curve: const Interval(0.6, 1));
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          return AnimatedBuilder(
            animation: Listenable.merge([batteryAnimatedController,batteryStateController]),
            builder: (context, child) => Scaffold(
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.1),
                          child: SvgPicture.asset(
                            Assets.car,
                            width: double.infinity,
                          ),
                        ),
                        AnimatedPositioned(
                          right: homeCubit.selectedBottomNavBar == 0
                              ? constraints.maxWidth * 0.05
                              : constraints.maxWidth / 2,
                          duration: Constants.defaultDuration,
                          child: AnimatedOpacity(
                            duration: Constants.defaultDuration,
                            opacity:
                                homeCubit.selectedBottomNavBar != 0 ? 0 : 1,
                            child: DoorLock(
                              onTap: () => homeCubit.changeDoorLockState('r'),
                              isOpened: homeCubit.doors['r']!,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          left: homeCubit.selectedBottomNavBar == 0
                              ? constraints.maxWidth * 0.05
                              : constraints.maxWidth / 2,
                          duration: Constants.defaultDuration,
                          child: AnimatedOpacity(
                            duration: Constants.defaultDuration,
                            opacity:
                                homeCubit.selectedBottomNavBar != 0 ? 0 : 1,
                            child: DoorLock(
                              onTap: () => homeCubit.changeDoorLockState('l'),
                              isOpened: homeCubit.doors['l']!,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: homeCubit.selectedBottomNavBar == 0
                              ? constraints.maxHeight * 0.15
                              : constraints.maxHeight / 2,
                          duration: Constants.defaultDuration,
                          child: AnimatedOpacity(
                            duration: Constants.defaultDuration,
                            opacity:
                                homeCubit.selectedBottomNavBar != 0 ? 0 : 1,
                            child: DoorLock(
                              onTap: () => homeCubit.changeDoorLockState('t'),
                              isOpened: homeCubit.doors['t']!,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          bottom: homeCubit.selectedBottomNavBar == 0
                              ? constraints.maxHeight * 0.15
                              : constraints.maxHeight / 2,
                          duration: Constants.defaultDuration,
                          child: AnimatedOpacity(
                            duration: Constants.defaultDuration,
                            opacity:
                                homeCubit.selectedBottomNavBar != 0 ? 0 : 1,
                            child: DoorLock(
                              onTap: () => homeCubit.changeDoorLockState('b'),
                              isOpened: homeCubit.doors['b']!,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: batteryAnimatedController.value,
                          child: SvgPicture.asset(
                            Assets.battery,
                            width: constraints.maxWidth / 2,
                          ),
                        ),
                        Positioned(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          top: 50*(1-batterStateAnimation.value),
                          child: Opacity(
                            opacity: batterStateAnimation.value,
                              child: BatteryState(
                            constraints: constraints,
                          )),
                        )
                      ],
                    );
                  },
                ),
              ),
              bottomNavigationBar: TeslaBottomNavBar(
                  animationController: batteryAnimatedController,
                  bottomNavIcons: bottomNavIcons,
                  selectedNavIndex: homeCubit.selectedBottomNavBar),
            ),
          );
        },
      ),
    );
  }
}


