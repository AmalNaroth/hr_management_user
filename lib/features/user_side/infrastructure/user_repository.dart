import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_management_user/core/resources/data_state.dart';
import 'package:hr_management_user/features/user_side/domain/user/user_model.dart';
import 'package:hr_management_user/features/user_side/domain/user/user_services.dart';
import 'package:hr_management_user/features/user_side/infrastructure/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserServises)
class UserRepository implements UserServises {
  @override
  Future<DataState<UserEntity>> getUserData() async {
    try {
      final authUuid = FirebaseAuth.instance.currentUser!.uid;
      final result = await FirebaseFirestore.instance
          .collection(
            "New Employees",
          )
          .doc(authUuid)
          .get();
      final data = UserModel.fromMap(
        result.data() ?? {},
      );
      return DataSuccess(data);
    } catch (e) {
      return DataFailed(e as FirebaseException);
    }
  }
}


