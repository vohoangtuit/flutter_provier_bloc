import 'package:floor/floor.dart';
import 'package:flutter_provider/models/user_model.dart';
@dao
abstract class UserDao {

  @Query('SELECT * FROM UserModel')
  Future<List<UserModel>> findAllUsers();

  @Query('SELECT * FROM UserModel WHERE id = :id LIMIT 1')
  Future<UserModel?> findUserById(String id);

  @Query('SELECT * FROM UserModel LIMIT 1')
  Future<UserModel?> getSingleUser();

  @insert
  Future<void> insertUser(UserModel user);

  @Query('DELETE FROM UserModel')
  Future<void> deleteAllUsers();

  @update
  Future<void> updateUser(UserModel user);

}