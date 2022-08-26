import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';
import 'package:flutter_provider/screens/base_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppProvider  {
 // final BaseScreen baseScreen;
  final FirebaseService firebaseService;
  final FloorDatabase floorDatabase;
  final SharedPreferences sharedPreferences;

  AppProvider( {required this.firebaseService,required this.floorDatabase,required this.sharedPreferences,});


}