import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tesla/models/temp_info_model.dart';
import 'package:tesla/models/tyre_info_model.dart';
import 'package:tesla/shared/network/dio_helper.dart';
import 'package:tesla/shared/network/firebase_services.dart';
import 'package:tesla/shared/styles/strings.dart';

import '../../../models/battery_info_model.dart';
import 'home_states.dart';

enum DoorDirection {
  left("left"),
  right("right"),
  front("front"),
  back("back");

  final String value;

  const DoorDirection(this.value);
}

class HomeCubit extends Cubit<HomeState> {
  int selectedBottomNavBar = 0;
  bool? connected;
  bool isTyresCurrentPage = false;
  Map<String, dynamic>? doorsStatus;
  final InternetConnectionChecker _internetConnectionChecker = InternetConnectionChecker();
  BatteryInfoModel? batteryInfoModel;
  TempInfoModel? tempInfoModel;
  TiresInfoModel? tiresInfoModel;

  HomeCubit() :super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


  void changeBottomNavBar(int index) {
    selectedBottomNavBar = index;
    emit(ChangeBottomNavBar());
  }

  void changeTyresVisibilityState(int index) {
    if (index == 3) {
      isTyresCurrentPage = true;
    } else {
      isTyresCurrentPage = false;
    }
  }

  void changeDoorLockState(DoorDirection dD) {
    doorsStatus![dD.value] = !doorsStatus![dD.value]!;

    emit(ChangeDoorLockState());
  }

  void coolHeatSwitcher() async
  {
    tempInfoModel!.isCool = !tempInfoModel!.isCool;
    if (await _internetConnectionChecker.hasConnection) {
      try {
        FirebaseServices.changeColdHeat(tempInfoModel!.isCool);
        emit(CoolHeatSwitchSuccessState());
      }
      catch (e) {
        tempInfoModel!.isCool = !tempInfoModel!.isCool;
        emit(CoolHeatSwitchFailedState(Strings.error));
      }
    }
    else
    {
      tempInfoModel!.isCool = !tempInfoModel!.isCool;
      emit(CoolHeatSwitchFailedState(Strings.noInternet));
   }
  }

  void increaseTempDegree() async
  {
    tempInfoModel!.tempDegree++;
    if (await _internetConnectionChecker.hasConnection) {
      try {
        FirebaseServices.changeTempDegree(tempInfoModel!.tempDegree);
        emit(IncreaseTempDegreeSuccessfullyState());
      }
      catch (e) {
        tempInfoModel!.tempDegree--;
        emit(IncreaseTempDegreeErrorState(Strings.error));
      }
    }
    else
    {
      tempInfoModel!.tempDegree--;
      emit(IncreaseTempDegreeErrorState(Strings.error));
   }
  }

  void decreaseTempDegree() async
  {
    tempInfoModel!.tempDegree--;
    if (await _internetConnectionChecker.hasConnection) {
      try {
        FirebaseServices.changeTempDegree(tempInfoModel!.tempDegree);
        emit(DecreaseTempDegreeSuccessfullyState());
      }
      catch (e) {
        tempInfoModel!.tempDegree++;
        emit(DecreaseTempDegreeErrorState(Strings.error));
      }
    }
    else
    {
      tempInfoModel!.tempDegree++;
      emit(DecreaseTempDegreeErrorState(Strings.error));
    }
  }


  void getDoorsStatues() async
  {
    if (await _internetConnectionChecker.hasConnection) {
      try {
        FirebaseFirestore.instance.collection("tesla").doc("doors")
            .snapshots()
            .listen((event) {
          doorsStatus = event.data();
          emit(GetDoorsStatusSuccess());
        }).onError((e) {
          emit(GetDoorsStatusError(Strings.error));
        });
      }
      catch (e) {
        print(e.toString());
        emit(GetDoorsStatusError(Strings.error));
      }
    }
    else {
      emit(GetDoorsStatusError(Strings.noInternet));
    }
  }

  void initConnection() async
  {
    _internetConnectionChecker.onStatusChange.listen((event) {
      print(event.toString());
      if (event == InternetConnectionStatus.connected) {
        getDoorsStatues();
        getBatteryInfo();
        getTempInfo();
        getTiresInfo();
        connected = true;
        emit(ChangeInternetState());
      }
      else {
        doorsStatus = null;
        tempInfoModel = null;
        batteryInfoModel = null;
        tiresInfoModel = null;
        connected = false;
        emit(ChangeInternetState());
      }
    });
  }

  void getBatteryInfo() async
  {
    if (await _internetConnectionChecker.hasConnection) {
      try {
        batteryInfoModel = await FirebaseServices.getBatteryInfo();
        emit(GetBatteryInfoSuccessfullyState());
      }
      catch (e) {
        emit(GetBatteryInfoErrorState(Strings.error));
      }
    }
    else {
      emit(GetBatteryInfoErrorState(Strings.noInternet));
    }
  }

  void getTiresInfo() async
  {
    if (await _internetConnectionChecker.hasConnection) {
      try {
        tiresInfoModel = await FirebaseServices.getTiresInfo();
        emit(GetTiresInfoSuccessfullyState());
      }
      catch (e) {
        emit(GetTiresInfoErrorState(Strings.error));
      }
    }
    else {
      emit(GetTiresInfoErrorState(Strings.noInternet));
    }
  }


  void getTempInfo() async
  {
    if (await _internetConnectionChecker.hasConnection) {
      try {
        tempInfoModel = await FirebaseServices.getTempInfo();
        emit(GetTempInfoSuccessfullyState());
      }
      catch (e) {
        emit(GetTempInfoErrorState(Strings.error));
        print(e.toString());
      }
    }
    else {
      emit(GetTempInfoErrorState(Strings.noInternet));
    }
  }

}