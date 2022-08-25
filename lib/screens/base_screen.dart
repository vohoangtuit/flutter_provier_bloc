import 'package:flutter/material.dart';
import 'package:flutter_provider/base/genneral_screen.dart';
import 'package:flutter_provider/base/loading_view.dart';
import 'package:flutter_provider/bloc/other_bloc.dart';
import 'package:flutter_provider/bloc/user_bloc.dart';
import 'package:flutter_provider/models/user_model.dart';
import 'package:flutter_provider/providers/app_provider.dart';
import 'package:flutter_provider/providers/user_provider.dart';
import 'package:provider/provider.dart';


abstract class BaseScreen<T extends StatefulWidget> extends GeneralScreen<T> {
  bool isOnline = true;
  bool? isLoading = false;
  bool firstLoad = true;
  bool endData = false;

  String userId='';
  String acc='';
  late AppProvider appProvider;
  late UserProvider userProvider;
  late UserBloc userBloc;
  late OtherBloc otherBloc;
  LoadingView? loadingView;

  @override
  initAll(){
    _initProviders();
    super.initAll();
    _initOther();
  }
  _initProviders()async{
    appProvider = context.read<AppProvider>();
   userProvider = context.read<UserProvider>();

    userBloc = UserBloc(baseScreen: this, provider: appProvider);
    otherBloc =OtherBloc(baseScreen: this, provider: appProvider);
  }
  _initOther(){
   loadingView =LoadingView();
  }
  void dismissLoading() {
    if (loadingView != null) {
      loadingView!.hide();
    }
  }
  void showLoading(bool show) {
    loadingView??=LoadingView();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted){
        if (show) {
          loadingView!.show(context);
        } else {
          loadingView!.hide();
        }
      }
    });
  }
  @override
  void disposeAll() {
    isLoading = false;
    firstLoad = true;
    endData = false;
    dismissLoading();
    super.disposeAll();
  }
  Future<String?> getIdAccount() async {

  }
  saveAccountToDB(UserModel user) async {

  }
  updateUserDatabase(UserModel user) async {

  }


  Future<UserModel> getProfileFromFirebase(UserModel user,{required bool saveLocal} ) async {
    UserModel? userModel;

    return userModel!;
  }
  updateUserAccount(UserModel user)async{
  }
  openLoginScreen(){
   // replaceScreen(const LoginScreen());
  }

}
