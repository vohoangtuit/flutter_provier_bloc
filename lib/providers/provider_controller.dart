import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProviderController {
  final BuildContext context;

  ProviderController({required this.context});

  saveUserId(String userID) {
    Provider.of<UserProvider>(context, listen: false).saveUserId(userID);
  }

  String getUserID() {
    print('getUserID()');
    return Provider.of<UserProvider>(context, listen: false).getUserId;
  }
  setUpdateUser(bool update){
    Provider.of<UserProvider>(context, listen: false).setUpdate(update);
  }
  bool getUserUpdated(){
    return  Provider.of<UserProvider>(context, listen: true).getUpdateUser;
  }
}
