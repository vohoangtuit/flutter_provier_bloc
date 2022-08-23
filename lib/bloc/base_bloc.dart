import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/base/loading_view.dart';
import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';
import 'package:flutter_provider/network/handler/dio_exceptions.dart';
import 'package:flutter_provider/network/network_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/base_screen.dart';
 class BaseBloc extends NetworkConfig{
  //final BuildContext screen;
  final BaseScreen context;
  final FirebaseService firebaseService;
  final FloorDatabase floorDatabase;
  final SharedPreferences sharedPre;
  //LoadingView loadingView;
  BaseBloc({required this.context,required this.firebaseService,required this.floorDatabase, required this.sharedPre, }) : super.internal();
   handleError(DioError dioError){
    String error =DioExceptions.fromDioError(dioError).toString();
  //  screen.showErrorRequest(error);
    context.loadingView!.hide();
    showLoading(false);

  }
   dispose() {}
  showLoading(bool show) {
   context.showLoading(show);
  }
}