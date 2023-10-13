import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/shared/constants.dart';
import 'package:tesla/shared/styles/assets.dart';

class DoorLock extends StatefulWidget {
  DoorLock({super.key, required this.onTap, required this.isOpened});

  void Function() onTap;
  final bool? isOpened;

  @override
  State<DoorLock> createState() => _DoorLockState();
}

class _DoorLockState extends State<DoorLock> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AnimationController(vsync: this),
      builder: (context, child) => GestureDetector(
        onTap: widget.onTap,
        child: AnimatedSwitcher(
            switchInCurve: Curves.easeInOutBack,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            duration: Constants.defaultDuration,
            child: widget.isOpened==null?
                const CircularProgressIndicator():
                widget.isOpened==true? SvgPicture.asset(
              Assets.doorUnlock,
              key: const Key(Assets.doorUnlock),
            )
                : SvgPicture.asset(
              Assets.doorLock,
              key: const Key(Assets.doorLock),
            )),
      ),
    );
  }
}
