import 'package:flutter/material.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class AttendenceScreen extends StatelessWidget {
  const AttendenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextWidget(
                textValue: "Good Morning",
                fontSize: 30,
                fontWeight: FontWeight.bold),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [TextWidget(textValue: "Check In")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [TextWidget(textValue: "Check Out")],
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextWidget(
                              textValue: "07:55: 25",
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              label: TextWidget(
                                  textValue: "clock In",
                                  fontColors: Colors.white),
                              icon: const Icon(Icons.login),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TextWidget(textValue: "07:55: 25"),
                            ElevatedButton.icon(
                              onPressed: () {},
                              label: TextWidget(
                                  textValue: "clock Out",
                                  fontColors: Colors.white),
                              icon: const Icon(Icons.logout_outlined),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return ListTile(
                title: TextWidget(textValue: "$index"),
              );
            }, separatorBuilder: (context, index) {
              return fHight20;
            }, itemCount: 10)
          ],
        ),
      ),
    );
  }
}
