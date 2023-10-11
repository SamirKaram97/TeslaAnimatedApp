import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tesla/screens/home/home_screen.dart';
import 'package:tesla/shared/bloc_observer.dart';
import 'package:tesla/shared/styles/themes.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.dark,
      home:  const HomeScreen(),
    );
  }
}

