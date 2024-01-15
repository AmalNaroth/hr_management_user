import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_management_user/config/routes/app_routes.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/core/navigator_services/navigator_services.dart';
import 'package:hr_management_user/features/user_side/application/bloc/dash_board_bloc.dart';
import 'package:hr_management_user/features/user_side/infrastructure/entities/user_entity.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/dashboard/time_widget.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

final GlobalKey<ScaffoldState> _skey = GlobalKey();

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashBoardBloc>().add(
          DashBoardInitialEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        if (state is DashBoardSuccessState) {
          return Scaffold(
              key: _skey,
              backgroundColor: Colors.black,
              body: dashBoardPage(data: state.data),
              drawer: dashBoardDrawer(context: context, data: state.data));
        } else if (state is DashBoardErrorState) {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

Widget dashBoardPage({required UserEntity data}) {
  return SafeArea(
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _skey.currentState?.openDrawer();
              },
              icon:
                  const Icon(Icons.diversity_2, color: Colors.white, size: 30),
            ),
            CircleAvatar(
              radius: 30.w,
              backgroundImage: NetworkImage(data.imageFile),
            ),
          ],
        ),
        TextWidget(
          textValue: data.userName,
          fontColors: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        fHight5,
        TextWidget(
          textValue: "Let's be productive toady!",
          fontColors: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        fHight10,
        const TimeWidget(),
        fHight50,
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    textValue: "Overview",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                          textValue: "May 2024",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              fHight20,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          TextWidget(
                              textValue: "Presence",
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          TextWidget(
                              textValue: "20",
                              fontSize: 30,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          TextWidget(
                              textValue: "Absens",
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          TextWidget(
                              textValue: "20",
                              fontSize: 30,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              fHight20,
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextWidget(
                          textValue: "Tuesday 18 April 2023",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      fHight20,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextWidget(
                                    textValue: "Check In",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                fHight10,
                                TextWidget(
                                  textValue: "12:55",
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextWidget(
                                    fontWeight: FontWeight.bold,
                                    textValue: "Check Out",
                                    fontSize: 20),
                                fHight10,
                                TextWidget(textValue: "12:55", fontSize: 20),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget dashBoardDrawer(
    {required BuildContext context, required UserEntity data}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1553877522-43269d4ea984?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  fit: BoxFit.cover)),
          accountName:
              TextWidget(textValue: data.userName, fontColors: Colors.white),
          accountEmail:
              TextWidget(textValue: data.userEmail, fontColors: Colors.white),
          currentAccountPicture: ClipOval(
            child: Image.network(
              data.imageFile,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Profile"),
            onTap: () =>
                NavigatorService.popAndPushNamed(AppRoutes.userProfile,arguments: data),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Attendence"),
            onTap: () => NavigatorService.popAndPushNamed(AppRoutes.attendence),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Leave"),
            onTap: () =>
                NavigatorService.popAndPushNamed(AppRoutes.leaveScreen),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: TextWidget(textValue: "Logout"),
                    content: TextWidget(
                        textValue: "Are you sure do you want to logout"),
                    actions: [
                      CupertinoDialogAction(
                        child: TextWidget(textValue: "Cancel"),
                        onPressed: () {
                          NavigatorService.goBack();
                        },
                      ),
                      CupertinoDialogAction(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut().then(
                            (value) {
                              NavigatorService.pushNamedAndRemoveUntil(
                                  AppRoutes.loginScreen);
                            },
                          );
                        },
                        isDestructiveAction: false,
                        child: TextWidget(
                            textValue: "Logout", fontColors: Colors.red),
                      ),
                    ],
                  );
                },
              );
            },
            title: Text("Logout"),
          ),
        )
      ],
    ),
  );
}
