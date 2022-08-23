import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_provider/database/last_message_dao.dart';
import 'package:flutter_provider/database/user_dao.dart';
import 'package:flutter_provider/models/last_message_model.dart';
import 'package:flutter_provider/models/user_model.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'demo_database.g.dart';
@Database(version: 1, entities: [UserModel,LastMessageModel])
abstract class TChatDatabase extends FloorDatabase {
  UserDao get userDao;
  LastMessageDao get lastMessageDao;
}