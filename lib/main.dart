import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/bloc/base_bloc_new.dart';
import 'package:flutter_provider/bloc/other_bloc.dart';
import 'package:flutter_provider/bloc/user_bloc.dart';
import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firebase_options.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';
import 'package:flutter_provider/providers/app_provider.dart';
import 'package:flutter_provider/providers/user_provider.dart';
import 'package:flutter_provider/screens/base_screen.dart';
import 'package:flutter_provider/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/loading_view.dart';
import 'shared_preferences/shared_preference.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // FloorDatabase floorDB= await FloorDatabase.init();
  FloorDatabase floorDB= FloorDatabase();
  await floorDB.init();

  SharedPreferences sharedPre =await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp(sharedPre:sharedPre,floorDB: floorDB,));
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPre;
  final FloorDatabase floorDB;
    MyApp({Key? key, required this.sharedPre, required this.floorDB,}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

   static bool initProvider =false;
   static setProvider(){
     initProvider =true;
   }
  static bool get getProvider =>initProvider;
}

class _MyAppState extends State<MyApp> {//BaseScreen || State
   FirebaseService  firebaseService = FirebaseService.getInstance();
  _MyAppState();

  @override
  Widget build(BuildContext context) {
   // MyApp.setProvider();// todo run set first run app to config provider
    return MultiProvider(
      providers: [
        Provider<AppProvider>(
            create: (_) => AppProvider(
                firebaseService: firebaseService,
                floorDatabase: widget.floorDB,
                sharedPreferences: widget.sharedPre)),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        home: const MainScreen(),
      ),
    );

  }

}
