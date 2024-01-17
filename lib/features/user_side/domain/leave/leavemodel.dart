import 'package:hr_management_user/features/user_side/infrastructure/entities/leave_entity.dart';
import 'package:uuid/uuid.dart';

class LeaveModel extends LeaveModelEntity {
  LeaveModel({
    required String id,
    required String fromDate,
    required String toDate,
    required String leaveReason,
    required bool status,
  }) : super(
          id: id,
          fromDate: fromDate,
          leaveReason: leaveReason,
          toDate: toDate,
          status: status,
        );

  factory LeaveModel.generate({
    required String fromDate,
    required String toDate,
    required String leaveReason,
    required bool status,
  }) {
    String id = const Uuid().v1();
    return LeaveModel(
      id: id,
      fromDate: fromDate,
      toDate: toDate,
      leaveReason: leaveReason,
      status: status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fromDate": fromDate,
      "toDate": toDate,
      "leaveReason": leaveReason,
      'status': status,
    };
  }

  factory LeaveModel.fromMap(Map<String, dynamic> json) {
    return LeaveModel(
        id: json['id'],
        fromDate: json['fromDate'],
        toDate: json['toDate'],
        leaveReason: json['leaveReason'],
        status: json['status']);
  }
}
