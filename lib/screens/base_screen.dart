import 'package:flutter/material.dart';
import 'package:flutter_provider/base/genneral_screen.dart';
import 'package:flutter_provider/bloc/user_bloc.dart';
import 'package:flutter_provider/models/user_model.dart';
import 'package:provider/provider.dart';


abstract class BaseScreen<T extends StatefulWidget>
    extends GeneralScreen<T> {
  bool isOnline = true;
  bool? isLoading = false;
  bool firstLoad = true;
  bool endData = false;

 //late UserProvider userProvider;
  String userId='';
  String acc='';
  late UserBloc userBloc;

  // @override
  // void didChangeDependencies() {
  //   log('didChangeDependencies');
  //   super.didChangeDependencies();
  // }
  @override
  initAll(){
    _initProviders();
    _initBloc();
    super.initAll();
    _initOther();
  }

  _initProviders()async{
    userBloc =context.read<UserBloc>();
    userId =userBloc.userId;
  }
 _initBloc (){

  }
  _initOther(){

  }

  @override
  void disposeAll() {
    isLoading = false;
    firstLoad = true;
    endData = false;
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
