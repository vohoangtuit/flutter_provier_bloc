import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/bloc/base_bloc.dart';
import 'package:flutter_provider/models/news_model.dart';
import 'package:flutter_provider/providers/provider_controller.dart';
import 'package:flutter_provider/shared_preferences/shared_preference.dart';
import 'package:dio/dio.dart';
 class UserBloc extends BaseBloc  with ChangeNotifier {

  UserBloc({required super.baseScreen, required super.provider});
  String _idUser='';
  String get userId => _idUser;

  String? getUserId() {
     return provider.sharedPre.getString(SharedPre.sharedPreID)??"";
  }
  saveIdUSer()async{
    String time =DateTime.now().millisecondsSinceEpoch.toString();
    provider.sharedPre.setString(SharedPre.sharedPreID, time);
   _idUser =time;
  ProviderController(context: baseScreen.context).saveUserId(_idUser);// todo c1
  ProviderController(context: baseScreen.context).setUpdateUser(true);// todo c2
  }
  Future<List<NewsModel>> getNews() async {
    List<NewsModel> list =<NewsModel>[];
   showLoading(true);
    try {
      await restApi.getNews(cacheOptions).then((value) => {
        if(value.response!=null){
          list = NewsModel.listNewsFromJson(value)
        }
      });
    } on DioError catch (dioError) {
     showLoading(false);
      //handleError(dioError);
      print('dioError ${dioError.message}');
      return list;
    }
  showLoading(false);
    return list;
  }
}