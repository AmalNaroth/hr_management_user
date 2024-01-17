import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/features/user_side/infrastructure/entities/user_entity.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserEntity;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            colorFilter: const ColorFilter.mode(
                                Colors.grey, BlendMode.color),
                            image: NetworkImage(args.imageFile),
                            fit: BoxFit.cover)),
                    height: 250.w,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 170.h,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(args.imageFile),
                    ),
                    fHight10,
                    TextWidget(
                      textValue: args.userName,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    fHight5,
                    TextWidget(
                      textValue: args.department,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                    Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 10,
                                color: Colors.black.withOpacity(0.2))
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                        textValue: "First name",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontColors: Colors.purple),
                                    fHight5,
                                    TextWidget(
                                        textValue: args.firstName,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                                fHight20,
                                TextWidget(
                                    textValue: "Last name",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColors: Colors.purple),
                                fHight5,
                                TextWidget(
                                    textValue: args.lastName,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight20,
                                TextWidget(
                                    textValue: "User Name",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColors: Colors.purple),
                                fHight5,
                                TextWidget(
                                    textValue: args.userName,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight20,
                                TextWidget(
                                    textValue: "Email",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColors: Colors.purple),
                                fHight5,
                                TextWidget(
                                    textValue: args.userEmail,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight20,
                                TextWidget(
                                    textValue: "Employee Id",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColors: Colors.purple),
                                fHight5,
                                TextWidget(
                                    textValue: args.employeeId,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight20,
                                TextWidget(
                                    textValue: "Department",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColors: Colors.purple),
                                fHight5,
                                TextWidget(
                                    textValue: args.department,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight20,
                                TextWidget(
                                    textValue: "Designation",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColors: Colors.purple),
                                fHight5,
                                TextWidget(
                                    textValue: args.designation,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight20,
                                TextWidget(
                                    textValue: "Join date",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontColors: Colors.purple),
                                fHight5,
                                TextWidget(
                                    textValue: args.joinDate,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
