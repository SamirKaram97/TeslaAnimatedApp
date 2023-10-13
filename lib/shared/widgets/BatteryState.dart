import 'package:flutter/material.dart';
import 'package:tesla/models/battery_info_model.dart';

import '../constants.dart';

class BatteryState extends StatelessWidget {
  const BatteryState({
    super.key,
    required this.constraints, required this.batteryInfoModel,
  });

  final BoxConstraints constraints;
  final BatteryInfoModel batteryInfoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: constraints.maxWidth*.05),
      child: Column(
        children: [
          Text(
            "${batteryInfoModel.miles} mi",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white),
          ),
           Text(
            "${batteryInfoModel.batteryPercentage}%",
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(),
          Text(
              batteryInfoModel.isCharging!?"Charging".toUpperCase():"",
            style: const TextStyle(fontSize: 20),
          ),
           Text(
            "${batteryInfoModel.rTime} min remaining",
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(height: constraints.maxHeight * 0.15),
          const DefaultTextStyle(
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("22 mi/hr"),
                  Text("232 v"),
                ],
              )),
          const SizedBox(height: Constants.defaultPadding),
        ],
      ),
    );
  }
}