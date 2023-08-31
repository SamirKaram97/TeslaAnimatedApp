import 'package:flutter/material.dart';

import '../constants.dart';

class BatteryState extends StatelessWidget {
  const BatteryState({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: constraints.maxWidth*.05),
      child: Column(
        children: [
          Text(
            "220 mi",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white),
          ),
          const Text(
            "62%",
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(),
          Text(
            "Charging".toUpperCase(),
            style: const TextStyle(fontSize: 20),
          ),
          const Text(
            "18 min remaining",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: constraints.maxHeight * 0.14),
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