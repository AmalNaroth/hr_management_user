import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/core/utils/screen_controllers/screen_controllers.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class LoginPasswordTextFormField extends StatefulWidget {
  LoginPasswordTextFormField({super.key});

  bool flag = true;

  @override
  State<LoginPasswordTextFormField> createState() =>
      _LoginPasswordTextFormFieldState();
}

class _LoginPasswordTextFormFieldState
    extends State<LoginPasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            textValue: "Password", fontSize: 15.sp, fontWeight: FontWeight.bold),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: LoginControlls.passwordControllers,
          validator: (value) {
             if(value==null || value.isEmpty){
              return "Enter the password";
            }
            return null;
          },
          obscureText: widget.flag,
          decoration: InputDecoration(
            hintText: "Enter your passwrod",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    widget.flag = !widget.flag;
                  },
                );
              },
              icon: widget.flag
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
