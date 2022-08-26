import 'package:dio/dio.dart';
import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';
import 'package:flutter_provider/network/handler/dio_exceptions.dart';
import 'package:flutter_provider/network/network_config.dart';
import 'package:flutter_provider/providers/app_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/base_screen.dart';
 abstract class BaseBloc extends NetworkConfig{
   final  BaseScreen screen;
   final AppProvider appProvider;

  BaseBloc({required this.screen,required this.appProvider}) : super.internal(sharedPreferences: appProvider.sharedPreferences);

   //BaseScreen get screen =>appProvider.baseScreen;

   FirebaseService get firebase =>appProvider.firebaseService;
   FloorDatabase get floorDB =>appProvider.floorDatabase;
   SharedPreferences get sharedPre =>appProvider.sharedPreferences;

   handleError(DioError dioError){
    String error =DioExceptions.fromDioError(dioError).toString();
  //  screen.showErrorRequest(error);
   showLoading(false);
  }

   dispose() {}
  showLoading(bool show) {
    if(show){
      screen.showLoading(true);
    }else{
      screen.showLoading(false);
    }
  }
}