import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeState>
{
  int selectedBottomNavBar=0;
  Map<String,bool> doors={'r':false,'l':false,'t':false,'b':false};

  HomeCubit():super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);



  void changeBottomNavBar(int index)
  {
    selectedBottomNavBar=index;
    emit(ChangeBottomNavBar());
  }

  void changeDoorLockState(String door)
  {
    doors[door]=!doors[door]!;
    print(doors);
    emit(ChangeDoorLockState());
  }
}