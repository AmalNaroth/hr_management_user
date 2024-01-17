import 'package:flutter/material.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/attendnce/apply_leave_bottomsheet.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return EmployeeAddLeaveBottomSheet();
                },
              );
            },
            child: TextWidget(
                textValue: "Apply leave",
                fontColors: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextWidget(textValue: "Your leave applications",
            fontSize: 16,),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ListTile();
                },
                separatorBuilder: (context, index) {
                  return fHight10;
                },
                itemCount: 10)
          ],
        ),
      ),
    );
  }
}
