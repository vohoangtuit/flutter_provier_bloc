import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/bloc/user_bloc.dart';
import 'package:flutter_provider/database/floor_init.dart';
import 'package:flutter_provider/firebase/firebase_options.dart';
import 'package:flutter_provider/firebase/firestore_database.dart';
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
 // LoadingView loadingView=LoadingView();
  SharedPreferences sharedPre =await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(  MyApp(sharedPre:sharedPre,floorDB: floorDB,));
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPre;
  final FloorDatabase floorDB;
  //final  LoadingView loadingView;
   const MyApp({Key? key, required this.sharedPre, required this.floorDB,}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseScreen<MyApp> {

   FirebaseService  firebaseService = FirebaseService.getInstance();
   UserBloc? userBloc_;

  @override
  Widget build(BuildContext context) {
    userBloc_ =UserBloc(context:this,firebaseService: firebaseService, floorDatabase: widget.floorDB, sharedPre: widget.sharedPre);
 //  userBloc_ =UserBloc(screen:baseScreen,firebaseService: firebaseService, floorDatabase: widget.floorDB, sharedPre: widget.sharedPre);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserBloc>(
          create: (_) => userBloc_!,),
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
