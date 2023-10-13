abstract class HomeState{
  String? message;
  HomeState({this.message});
}

class HomeInitialState extends HomeState{


}

class ChangeBottomNavBar extends HomeState{}
class ChangeDoorLockState extends HomeState{}
class CoolHeatSwitchSuccessState extends HomeState{}
class CoolHeatSwitchFailedState extends HomeState{

  CoolHeatSwitchFailedState(String message):super(message: message);
}
class ChangeTempDegreeState extends HomeState{}
class GetDoorsStatusSuccess extends HomeState{

}
class GetDoorsStatusError extends HomeState{

  GetDoorsStatusError(String message):super(message: message);
}
class ChangeInternetState extends HomeState{}

class GetBatteryInfoSuccessfullyState extends HomeState{}
class GetBatteryInfoErrorState extends HomeState{
  GetBatteryInfoErrorState(String message):super(message: message);
}


class GetTempInfoSuccessfullyState extends HomeState{}
class GetTempInfoErrorState extends HomeState{
  GetTempInfoErrorState(String message):super(message: message);
}

class GetTiresInfoSuccessfullyState extends HomeState{}
class GetTiresInfoErrorState extends HomeState{
  GetTiresInfoErrorState(String message):super(message: message);
}

class IncreaseTempDegreeSuccessfullyState extends HomeState{}
class IncreaseTempDegreeErrorState extends HomeState{
  IncreaseTempDegreeErrorState(String message):super(message: message);
}

class DecreaseTempDegreeSuccessfullyState extends HomeState{}
class DecreaseTempDegreeErrorState extends HomeState{
  DecreaseTempDegreeErrorState(String message):super(message: message);
}


