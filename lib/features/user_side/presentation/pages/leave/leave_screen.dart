import 'package:flutter/material.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/attendnce/apply_leave_bottomsheet.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context, builder: (context) {
                  return EmployeeAddLeaveBottomSheet();
                },);
              },
              child: TextWidget(
                  textValue: "Apply leave", fontColors: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
