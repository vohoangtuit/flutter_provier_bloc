import 'package:dio/dio.dart';
import 'package:flutter_provider/network/handler/dio_exceptions.dart';
import 'package:flutter_provider/network/network_config.dart';
import 'package:flutter_provider/providers/app_provider.dart';

import '../screens/base_screen.dart';
 abstract class BaseBloc extends NetworkConfig{
   final  BaseScreen baseScreen;
   final AppProvider provider;

  BaseBloc({required this.baseScreen,required this.provider}) : super.internal(sharedPre: provider.sharedPre);
   // BaseBloc.init(this.baseScreen, this.provider){
   //
   // }

   handleError(DioError dioError){
    String error =DioExceptions.fromDioError(dioError).toString();
  //  screen.showErrorRequest(error);
   showLoading(false);
  }

   dispose() {}
  showLoading(bool show) {
    if(show){
      baseScreen.showLoading(true);
    }else{
      baseScreen.showLoading(false);
    }
  }
}