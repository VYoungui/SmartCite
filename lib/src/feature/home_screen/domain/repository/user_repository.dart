import 'package:smart_cite/src/feature/home_screen/domain/entities/user_entity.dart';
import '../../../../config/ressources/data_state.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getNewUser();
  Future<List<UserEntity>> getSavedUser();
  Future<void> saveUser(UserEntity user);
  Future<void> removeUser(UserEntity user);
}