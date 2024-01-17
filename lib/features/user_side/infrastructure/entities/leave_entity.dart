// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LeaveModelEntity extends Equatable {
  final String id;
  final String fromDate;
  final String toDate;
  final String leaveReason;
  final bool status;

  LeaveModelEntity({
    required this.id,
    required this.fromDate,
    required this.toDate,
    required this.leaveReason,
    required this.status,
  });

  @override
  List<Object?> get props => [
    id, // Include 'id' in the props list if it's part of the equality comparison
    fromDate,
    toDate,
    leaveReason,
    status
  ];
}
