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
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _skey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.diversity_2,
                    color: Colors.white, size: 30),
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(data.imageFile),
              ),
            ],
          ),
        ),
        TextWidget(
          textValue: data.userName,
          fontColors: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        TextWidget(
          textValue: "Let's be productive today!",
          fontColors: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 10),
        const TimeWidget(),
        const SizedBox(height: 50),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 4,
                color: Colors.black.withOpacity(0.3),
              )
            ],
            gradient: const LinearGradient(colors: [
              Color(0xff292459),
              Color(0xff8269B1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  textValue: "Savari",
                  fontSize: 27,
                  fontColors: Colors.white,
                  fontWeight: FontWeight.w500),
              fHight20,
              TextWidget(
                textValue:
                    "Introducing the ultimate travel companion app, seamlessly combining personalized"
                    " itinerary planning, real-time navigation, and curated recommendations to"
                    " ensure a perfect journey tailored just for you.",
                fontSize: 17,
                fontColors: Colors.white60,
                fontWeight: FontWeight.w400,
              ),
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
            onTap: () => NavigatorService.popAndPushNamed(AppRoutes.userProfile,
                arguments: data),
          ),
        ),
        // Card(
        //   child: ListTile(
        //     title: const Text("Attendence"),
        //     onTap: () => NavigatorService.popAndPushNamed(AppRoutes.attendence),
        //   ),
        // ),
        // Card(
        //   child: ListTile(
        //     title: const Text("Leave"),
        //     onTap: () =>
        //         NavigatorService.popAndPushNamed(AppRoutes.leaveScreen),
        //   ),
        // ),
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
