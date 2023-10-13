import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tesla/models/battery_info_model.dart';
import 'package:tesla/models/temp_info_model.dart';
import 'package:tesla/models/tyre_info_model.dart';

class FirebaseServices
{

  static Future<BatteryInfoModel> getBatteryInfo()async
  {
    var response= await FirebaseFirestore.instance.collection("tesla").doc("battery").get();
    BatteryInfoModel batteryInfoModel=BatteryInfoModel.fromJson(response.data()!);
    return batteryInfoModel;
  }

  static Future<TempInfoModel> getTempInfo()async
  {
    var response= await FirebaseFirestore.instance.collection("tesla").doc("temp").get();
    TempInfoModel tempInfoModel=TempInfoModel.fromJson(response.data()!);
    return tempInfoModel;
  }

  static Future<TiresInfoModel> getTiresInfo()async
  {
    var response= await FirebaseFirestore.instance.collection("tesla").doc("tires").get();
    TiresInfoModel tiresInfoModel=TiresInfoModel.fromJson(response.data()!);
    return tiresInfoModel;
  }

  static Future<void> changeColdHeat(bool isCool)
  {
    return FirebaseFirestore.instance.collection("tesla").doc("temp").update({"isCool":isCool});
  }

  static Future<void> changeTempDegree(int temp)
  {
    return FirebaseFirestore.instance.collection("tesla").doc("temp").update({"tempDegree":temp});
  }

}

