import 'package:flutter/material.dart';
import 'package:tesla/shared/network/end_points.dart';

import '../../screens/home/cubit/home_cubit.dart';
import '../constants.dart';
import 'DoorLock.dart';

class DoorLockStack extends StatelessWidget {
  const DoorLockStack({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    var homeCubit=HomeCubit.get(context);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
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
              onTap: () => HomeCubit.get(context).selectedBottomNavBar==0?homeCubit.changeDoorLockState(DoorDirection.right):null,
              isOpened: homeCubit.doorsStatus?[DoorDirection.right.value],
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
              onTap: () => HomeCubit.get(context).selectedBottomNavBar==0?homeCubit.changeDoorLockState(DoorDirection.left):null,
              isOpened: homeCubit.doorsStatus?[DoorDirection.left.value],
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
              onTap: () => HomeCubit.get(context).selectedBottomNavBar==0?homeCubit.changeDoorLockState(DoorDirection.front):null,
              isOpened: homeCubit.doorsStatus?[DoorDirection.front.value],
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
              onTap: () => HomeCubit.get(context).selectedBottomNavBar==0?homeCubit.changeDoorLockState(DoorDirection.back):null,
              isOpened: homeCubit.doorsStatus?[DoorDirection.back.value],
            ),
          ),
        ),
      ],
    );
  }
}