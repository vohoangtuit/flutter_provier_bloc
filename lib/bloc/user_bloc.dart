import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/bloc/base_bloc.dart';
import 'package:flutter_provider/models/news_model.dart';
import 'package:flutter_provider/providers/user_provider.dart';
import 'package:flutter_provider/shared_preferences/shared_preference.dart';
import 'package:dio/dio.dart';

class UserBloc extends BaseBloc with ChangeNotifier {
  final UserProvider userProvider;
  UserBloc({required this.userProvider,required super.screen, required super.appProvider});

  String _idUser = '';

  String get userId => _idUser;

  String? getUserId() {
    return sharedPre.getString(SharedPre.sharedPreID) ?? "";
  }

  saveIdUSer() async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    sharedPre.setString(SharedPre.sharedPreID, time);
    _idUser = time;
    userProvider.saveUserId(_idUser);
    // ProviderController(context: screen.context).saveUserId(_idUser); // todo c1
    // ProviderController(context: screen.context).setUpdateUser(true); // todo c2
  }

  Future<List<NewsModel>> getNews() async {
    List<NewsModel> list = <NewsModel>[];
    showLoading(true);
    try {
      await restApi.getNews(cacheOptions).then((value) => {
            if (value.response != null)
              {list = NewsModel.listNewsFromJson(value)}
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
