import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tesla/models/doors_status_model.dart';
import 'package:tesla/shared/network/end_points.dart';

class DioHelper {
  static Dio? _dio;


  static void init() {

    _dio = Dio(
      BaseOptions(
          baseUrl: BASE_URL,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type':'application/json',
          }
      ),
    );
  }

  static Future<Map<String,dynamic>> getDoorsStatus()async
  {
    var response = await _dio!.get(DOORS);
    print(response.data.runtimeType);
    return response.data;
  }

}