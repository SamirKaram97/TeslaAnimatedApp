
import 'package:flutter/material.dart';
import 'package:tesla/models/tyre_info_model.dart';
import 'package:tesla/shared/styles/colors.dart';

import '../constants.dart';

class TyreCard extends StatelessWidget {
  const TyreCard({
    super.key, required this.model, required this.index,
  });

  final TireModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: model?.isLow??false?AppColors.white10:AppColors.redColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: model?.isLow??false?AppColors.primaryColor:AppColors.redColor)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: index>1?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text:  TextSpan(
                    text: "${model.psi}",
                    style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                    children: const [
                  TextSpan(
                      text: "psi",
                      style: TextStyle(fontSize: 24))
                ])),
            const SizedBox(height: Constants.defaultPadding,),
            Text("${model.tempDegree}\u2103",style: const TextStyle(fontSize: 18,color: AppColors.white45),),
            const Spacer(),
            Text(model?.isLow??false?"low".toUpperCase():"high".toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
            Text("pressure".toUpperCase(),style: const TextStyle(color: AppColors.white45,fontSize: 22),),


          ],
        ):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model?.isLow??false?"low".toUpperCase():"high".toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
            Text("pressure".toUpperCase(),style: const TextStyle(color: AppColors.white45,fontSize: 22),),
            const Spacer(),
            RichText(
                text:  TextSpan(
                    text: "${model.psi}",
                    style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                    children: const [
                      TextSpan(
                          text: "psi",
                          style: TextStyle(fontSize: 24))
                    ])),
            const SizedBox(height: Constants.defaultPadding,),
            Text("${model.tempDegree}\u2103",style: const TextStyle(fontSize: 18,color: AppColors.white45),),




          ],
        ),
      ),
    );
  }
}