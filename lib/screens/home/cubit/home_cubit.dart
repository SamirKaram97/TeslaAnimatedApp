import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tesla/models/temp_info_model.dart';
import 'package:tesla/shared/network/dio_helper.dart';

import 'home_states.dart';

enum DoorDirection{
  left("left"),
  right("right"),
  front("front"),
  back("back");

  final String value;
  const DoorDirection(this.value);
}

class HomeCubit extends Cubit<HomeState>
{
  int selectedBottomNavBar=0;
  bool isCool=false;
  bool isTyresCurrentPage=false;
  Map<String,dynamic>? doorsStatus;
  final InternetConnectionChecker _internetConnectionChecker=InternetConnectionChecker();

  HomeCubit():super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);



  void changeBottomNavBar(int index)
  {
    selectedBottomNavBar=index;
    emit(ChangeBottomNavBar());
  }

  void changeTyresVisibilityState(int index)
  {
    if(index==3) {
      isTyresCurrentPage=true;
    } else {
      isTyresCurrentPage=false;
    }
  }

  void changeDoorLockState(DoorDirection dD)
  {
    doorsStatus![dD.value]=!doorsStatus![dD.value]!;
    emit(ChangeDoorLockState());
  }

  void coolHeatSwitcher()
  {
    tempInfoModel.isCool=!tempInfoModel.isCool;
    emit(CoolHeatSwitchState());
  }
  void increaseTempDegree()
  {
    tempInfoModel.tempDegree++;
    emit(ChangeTempDegreeState());
  }
  void decreaseTempDegree()
  {
    tempInfoModel.tempDegree--;
    emit(ChangeTempDegreeState());
  }

  void getDoorsStatues()async
  {
    if(await _internetConnectionChecker.hasConnection)
    {
    try{
      var response=await DioHelper.getDoorsStatus();
      doorsStatus=response.cast<String, dynamic>() ;
      emit(GetDoorsStatusSuccess());
    }
    catch(e)
    {
      print(e.toString());
      emit(GetDoorsStatusError());
    }
  }
    else{
      emit(GetDoorsStatusInternetError());
    }
  }

}