

import 'package:flutter/material.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/core/navigator_services/navigator_services.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/calender_widget.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class EmployeeAddLeaveBottomSheet extends StatelessWidget {
  EmployeeAddLeaveBottomSheet({
    super.key,
  });

  TextEditingController _fromLeaveController = TextEditingController();
  TextEditingController _toLeaveController = TextEditingController();
  TextEditingController _reasonLeaveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            fHight70,
            TextWidget(
              textValue: "Add Leave",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            fHight20,
            // CustomDropDownButton01(
            //     listItems: [
            //       "Sick Leave",
            //       "Personal Leave",
            //       "Unpaid Leave"
            //     ],
            //     title: "Leave Type",
            //     hintText: "Select Leave Type",
            //     ),
            CustomCalenderFormField(
              fieldTitle: "From",
            ),
            CustomCalenderFormField(
              fieldTitle: "To",
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                textValue: "Number of days",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            fHight10,
            Container(
              padding: EdgeInsets.all(10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(textValue: ""),
                ],
              ),
            ),
            fHight20,
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                textValue: "Remaining Leaves",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            fHight10,
            Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(textValue: ""),
                ],
              ),
            ),
            fHight20,
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                textValue: "Leave Reason",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            fHight10,
            TextFormField(
              
              keyboardType: TextInputType.multiline,
              minLines: 5, //Normal textInputField will be displayed
              maxLines: 5,
              decoration: InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),),
            ),
            fHight30,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                fixedSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              onPressed: () {
                NavigatorService.goBack();
              },
              child: TextWidget(textValue: "Submit",fontSize: 17,
              fontColors: Colors.white,
              fontWeight: FontWeight.bold),
            ),
            fHight30,
          ],
        ),
      ),
    );
  }
}
