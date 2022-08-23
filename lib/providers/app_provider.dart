import 'package:flutter/foundation.dart';
import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';

import '../shared_preferences/shared_preference.dart';

class AppProvider extends ChangeNotifier{
  final FirebaseService firebaseService;
  final FloorDatabase floorDatabase;
  final SharedPre sharedPre;

  String _idUser='';

  String get getIdUser => _idUser;
  AppProvider({required this.firebaseService,required this.floorDatabase,required this.sharedPre, });
  Future<String?> getFirebaseUserId() async{
    return  sharedPre.getStringKey(SharedPre.sharedPreID);
  }
  String? getId() {
   // return sharedPre.getStringKey(SharedPre.sharedPreID);
  }
  saveIdUSer()async{
    String time =DateTime.now().millisecondsSinceEpoch.toString();
    sharedPre.saveString(SharedPre.sharedPreID, time);
    _idUser =time;
    notifyListeners();
  }

}