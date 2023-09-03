import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesla/models/temp_info_model.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeState>
{
  int selectedBottomNavBar=0;
  bool isCool=false;
  bool isTyresCurrentPage=false;
  Map<String,bool> doors={'r':false,'l':false,'t':false,'b':false};

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



  void changeDoorLockState(String door)
  {
    doors[door]=!doors[door]!;
    print(doors);
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
}