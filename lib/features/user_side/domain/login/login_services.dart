 import 'package:hr_management_user/core/resources/data_state.dart';

abstract class LoginServices{
  Future<DataState> loginFunction({required String email,required String password});
 }