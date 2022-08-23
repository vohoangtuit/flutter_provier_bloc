import 'package:floor/floor.dart';
import 'package:flutter_provider/database/demo_database.dart';
import 'package:flutter_provider/database/user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'last_message_dao.dart';

class FloorDatabase {
  static FloorDatabase? _instance;
  static TChatDatabase? database;
  static UserDao? userDao;
  static  LastMessageDao? messageDao;

   Future<FloorDatabase> getInstance() async {
    // print('FloorDatabase getInstance()');
    _instance ??= FloorDatabase();
    database ??=
        await $FloorTChatDatabase.databaseBuilder('DemoDBApp.db').build();
    userDao ??= database!.userDao;
    messageDao ??= database!.lastMessageDao;
    // print('FloorDatabase getInstance() 1');
    return _instance!;
  }

  init() async {
    //  print('FloorDatabase init()');
    database = await $FloorTChatDatabase.databaseBuilder('DemoDBApp.db').build();
    userDao = database!.userDao;
    messageDao = database!.lastMessageDao;
    // print('FloorDatabase init() 1');
  }
}
