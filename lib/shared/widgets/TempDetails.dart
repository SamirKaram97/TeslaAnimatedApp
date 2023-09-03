import 'package:flutter/material.dart';
import 'package:tesla/screens/home/cubit/home_cubit.dart';

import '../../models/temp_info_model.dart';
import '../constants.dart';
import 'TempSwitcherBtn.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required this.model,

  });

  final TempInfoModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                TempSwitcherBtn(
                  isCool: model.isCool,
                ),
                const SizedBox(
                  width: 10,
                ),
                TempSwitcherBtn(
                    isCool: model.isCool, forCool: false),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(onPressed: (){
                HomeCubit.get(context).increaseTempDegree();
              }, icon: const Icon(size: 48,Icons.arrow_drop_up),padding: EdgeInsets.zero,),
              Text("${model.tempDegree} \u2103",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 86),),
              IconButton(onPressed: (){
                HomeCubit.get(context).decreaseTempDegree();
              }, icon: const Icon(size: 48,Icons.arrow_drop_down),padding: EdgeInsets.zero,),
            ],
          ),
          const Spacer(),
          const Text("CURRENT TEMPERATURE"),
          const SizedBox(height: Constants.defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inside".toUpperCase(),
                  ),
                  Text(
                    "${model.insideTempDegree}\u2103",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const SizedBox(width: Constants.defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inside".toUpperCase(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  Text(
                    "${model.outsideTempDegree}\u2103",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  )
                ],
              ),
            ],
          )


        ],
      ),
    );
  }
}