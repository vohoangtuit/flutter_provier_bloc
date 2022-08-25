import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppProvider  {
  final FirebaseService firebaseService;
  final FloorDatabase floorDatabase;
  final SharedPreferences sharedPre;

  AppProvider({required this.firebaseService,required this.floorDatabase,required this.sharedPre, });


}