import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_management_user/core/utils/screen_controllers/screen_controllers.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class LoginEmailTextFormField extends StatelessWidget {
  const LoginEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        TextWidget(
            textValue: "Email Address",
            fontSize: 15.sp,
            fontWeight: FontWeight.bold),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: LoginControlls.emailControllers,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter the email address";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Enter your email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
