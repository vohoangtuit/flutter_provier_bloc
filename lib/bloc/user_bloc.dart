import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/base/loading_view.dart';
import 'package:flutter_provider/bloc/base_bloc.dart';
import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';
import 'package:flutter_provider/models/news_model.dart';
import 'package:flutter_provider/screens/base_screen.dart';
import 'package:flutter_provider/shared_preferences/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
 class UserBloc extends BaseBloc  with ChangeNotifier {
  String _idUser='';

  UserBloc({required super.context, required super.firebaseService, required super.floorDatabase, required super.sharedPre});

  //UserBloc({required super.screen, required super.firebaseService, required super.floorDatabase, required super.sharedPre});
 // UserBloc(required BaseScreen context, required FirebaseService firebaseService, required FloorDatabase floorDatabase, required SharedPreferences sharedPre}) : super(context:context, firebaseService:firebaseService, floorDatabase:floorDatabase, sharedPre:sharedPre);
  String get userId => _idUser;

  String? getUserId() {
     return sharedPre.getString(SharedPre.sharedPreID);
  }
  saveIdUSer()async{
    String time =DateTime.now().millisecondsSinceEpoch.toString();
    sharedPre.setString(SharedPre.sharedPreID, time);
   _idUser =time;
  // print('_idUser $_idUser');
   notifyListeners();
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