abstract class HomeState{}

class HomeInitialState extends HomeState{}

class ChangeBottomNavBar extends HomeState{}
class ChangeDoorLockState extends HomeState{}
class CoolHeatSwitchState extends HomeState{}
class ChangeTempDegreeState extends HomeState{}
class GetDoorsStatusSuccess extends HomeState{

}
class GetDoorsStatusError extends HomeState{

}

class GetDoorsStatusInternetError extends HomeState{

}