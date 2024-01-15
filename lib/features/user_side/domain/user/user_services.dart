import 'package:hr_management_user/core/resources/data_state.dart';
import 'package:hr_management_user/features/user_side/infrastructure/entities/user_entity.dart';

abstract class UserServises{
  Future<DataState<UserEntity>> getUserData();
}