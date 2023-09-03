import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/models/temp_info_model.dart';
import 'package:tesla/shared/constants.dart';
import 'package:tesla/shared/styles/assets.dart';

import '../../screens/home/cubit/home_cubit.dart';
import '../styles/colors.dart';

class TempSwitcherBtn extends StatelessWidget {
  const TempSwitcherBtn(
      {super.key, this.forCool = true, required this.isCool});

  final bool isCool;
  final bool forCool;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HomeCubit.get(context).coolHeatSwitcher();
        print(tempInfoModel.isCool);
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: Constants.defaultDuration,
            height: forCool && isCool || !forCool && !isCool ? 70 : 50,
            width: forCool && isCool || !forCool && !isCool ? 70 : 50,
            child: SvgPicture.asset(
              forCool ? Assets.coolShape : Assets.hotShape,
              color: forCool && isCool
                  ? AppColors.primaryColor
                  : !forCool && !isCool
                      ? AppColors.redColor
                      : Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            forCool ? "cool".toUpperCase() : "heat".toUpperCase(),
            style: TextStyle(
                color: forCool && isCool
                    ? AppColors.primaryColor
                    : !forCool && !isCool
                        ? AppColors.redColor
                        : Colors.grey,
                fontSize: forCool && isCool || !forCool && !isCool ? 16 : 12),
          )
        ],
      ),
    );
  }
}