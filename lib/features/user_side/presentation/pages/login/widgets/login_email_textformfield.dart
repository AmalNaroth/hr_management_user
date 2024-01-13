import 'package:flutter/material.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/core/utils/screen_controllers/screen_controllers.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class LoginEmailTextFormField extends StatelessWidget {
  const LoginEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fHight30,
        TextWidget(
            textValue: "Email Address",
            fontSize: 17,
            fontWeight: FontWeight.bold),
        fHight10,
        TextFormField(
          controller: LoginControlls.emailControllers,
          validator: (value) {
            if(value==null || value.isEmpty){
              return "Enter the email address";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Enter your email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        fHight20,
      ],
    );
  }
}
