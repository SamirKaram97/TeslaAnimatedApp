import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/models/temp_info_model.dart';
import 'package:tesla/models/tyre_info_model.dart';
import 'package:tesla/screens/home/cubit/home_states.dart';
import 'package:tesla/shared/constants.dart';
import 'package:tesla/shared/network/dio_helper.dart';
import 'package:tesla/shared/styles/assets.dart';
import 'package:tesla/shared/styles/colors.dart';

import '../../shared/widgets/BatteryState.dart';
import '../../shared/widgets/DoorLockStack.dart';
import '../../shared/widgets/PositionedCar.dart';
import '../../shared/widgets/TempDetails.dart';
import '../../shared/widgets/TempSwitcherBtn.dart';
import '../../shared/widgets/TeslaBottomNavBar.dart';
import '../../shared/widgets/TyreCard.dart';
import '../../shared/widgets/TyresStack.dart';
import 'cubit/home_cubit.dart';
import 'package:tesla/models/tyre_info_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController batteryAnimatedController;
  late Animation<double> batteryAnimation;
  late Animation<double> batterStateAnimation;
  late AnimationController tempAnimatedController;
  late AnimationController tyresAnimatedController;
  late Animation<double> shiftCarAnimation;
  late Animation<double> glowAnimation;
  late Animation<double> detailsAnimation;
  late Animation<double> tyresOpacityAnimation;
  late Animation<double> highTyresAnimation;
  late Animation<double> lowTyresAnimation;

  void initAnimation() {
    //battery
    batteryAnimatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    batteryAnimation = CurvedAnimation(
        parent: batteryAnimatedController, curve: const Interval(0.4, 0.6));
    batterStateAnimation = CurvedAnimation(
        parent: batteryAnimatedController, curve: const Interval(0.7, 1));

    //temp
    tempAnimatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    shiftCarAnimation = CurvedAnimation(
        parent: tempAnimatedController, curve: const Interval(0.15, 0.4));
    detailsAnimation = CurvedAnimation(
        parent: tempAnimatedController, curve: const Interval(0.45, 0.6));
    glowAnimation = CurvedAnimation(
        parent: tempAnimatedController, curve: const Interval(0.6, 0.8));

    //tyres
    tyresAnimatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    tyresOpacityAnimation = CurvedAnimation(
        parent: tyresAnimatedController, curve: const Interval(0.4, 0.5));
    highTyresAnimation = CurvedAnimation(
        parent: tyresAnimatedController, curve: const Interval(0.6, 0.8));
    lowTyresAnimation = CurvedAnimation(
        parent: tyresAnimatedController, curve: const Interval(0.8,0.9));
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDoorsStatues(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          return AnimatedBuilder(
            animation: Listenable.merge([
              batteryAnimatedController,
              tempAnimatedController,
              tyresAnimatedController
            ]),
            builder: (context, child) => Scaffold(
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    print(constraints.maxWidth);
                    return Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                        ),
                        PositionedCar(
                          tyresOpacityAnimation: tyresOpacityAnimation,
                            shiftCarAnimation: shiftCarAnimation,
                            constraints: constraints),
                          DoorLockStack(
                          constraints: constraints,
                        ),
                        if(homeCubit.selectedBottomNavBar==1)
                          ...[Opacity(
                            opacity: batteryAnimation.value,
                            child: SvgPicture.asset(
                              Assets.battery,
                              width: constraints.maxWidth / 2,

                            ),
                          ),
                            Positioned(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              top: 50 * (1 - batterStateAnimation.value),
                              child: Opacity(
                                  opacity: batterStateAnimation.value,
                                  child: BatteryState(
                                    constraints: constraints,
                                  )),
                            ),],
                        if(homeCubit.selectedBottomNavBar==2)
                          ...[Positioned(
                            right: -180 * (1 - glowAnimation.value),
                            child: tempInfoModel.isCool
                                ? Image.asset(
                              key: UniqueKey(),
                              Assets.coolGlow,
                              height: constraints.maxHeight,
                            )
                                : Image.asset(
                              key: UniqueKey(),
                              Assets.hotGlow,
                              height: constraints.maxHeight,
                            ),
                          ),
                            Positioned(
                              top: 100 * (1 - detailsAnimation.value),
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              child: Opacity(
                                opacity: detailsAnimation.value,
                                child: TempDetails(model: tempInfoModel),
                              ),
                            ),],
                        if(homeCubit.isTyresCurrentPage)...[
                          GridView.builder(
                            physics:const  NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: Constants.defaultPadding,
                                mainAxisSpacing: Constants.defaultPadding,
                                crossAxisCount: 2,
                                childAspectRatio: constraints.maxWidth /
                                    constraints.maxHeight),
                            itemCount: 4,
                            itemBuilder: (context, index) => Opacity(opacity: tyresInfo[index].isLow?lowTyresAnimation.value:highTyresAnimation.value,child: TyreCard(model: tyresInfo[index],index: index,)),
                          )]
                      ],
                    );
                  },
                ),
              ),
              bottomNavigationBar: TeslaBottomNavBar(
                  carAnimationController: tempAnimatedController,
                  tyreAnimationController: tyresAnimatedController,
                  batteryAnimationController: batteryAnimatedController,
                  selectedNavIndex: homeCubit.selectedBottomNavBar),
            ),
          );
        },
      ),
    );
  }
}

