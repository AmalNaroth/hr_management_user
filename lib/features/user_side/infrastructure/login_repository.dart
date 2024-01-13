import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_management_user/core/resources/data_state.dart';
import 'package:hr_management_user/features/user_side/domain/login/login_services.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: LoginServices)
class LoginRepository implements LoginServices{
  @override
  Future<DataState> loginFunction({required String email, required String password}) async{
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return const DataSuccess("Login success");
    } catch (e) {
      return DataFailed(e as FirebaseException);
    }
  }

}