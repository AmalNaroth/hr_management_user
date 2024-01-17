import 'package:hr_management_user/core/resources/data_state.dart';
import 'package:hr_management_user/features/user_side/domain/leave/leavemodel.dart';

abstract class LeaveServices{
  Future<DataState> uploadLeave({required LeaveModel data});
  Future<DataState> getLeave();
} 