import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
   String _idUser='';
   bool update=false;
  String get getUserId => _idUser;
   bool get getUpdateUser => update;
  saveUserId(String idUSer){
   _idUser =idUSer;
    notifyListeners();
  }
   setUpdate(bool isUpdate){
     update =isUpdate;
     notifyListeners();
   }

}