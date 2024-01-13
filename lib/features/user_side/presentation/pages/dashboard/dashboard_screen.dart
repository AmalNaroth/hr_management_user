import 'package:flutter/material.dart';
import 'package:hr_management_user/config/routes/app_routes.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/core/navigator_services/navigator_services.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/dashboard/time_widget.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

final GlobalKey<ScaffoldState> _skey = GlobalKey();

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _skey,
      backgroundColor: Colors.black,
      body: SafeArea(
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
                  icon: const Icon(Icons.diversity_2,
                      color: Colors.white, size: 30),
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1704981103922-3d80a026922e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                ),
              ],
            ),
            TextWidget(
              textValue: "Amal Naroth",
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
                                    TextWidget(
                                        textValue: "12:55", fontSize: 20),
                                  ],
                                ),
                              )
                            ],
                          )
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 15, bottom: 20),
                          //   child: PaginatedDataTable(
                          //     columns: [
                          //       DataColumn(
                          //         label: Text("Leave Type"),
                          //       ),
                          //       DataColumn(
                          //         label: Text("From"),
                          //       ),
                          //       DataColumn(
                          //         label: Text("To"),
                          //       ),
                          //       DataColumn(
                          //         label: Text("No of Days"),
                          //       ),
                          //       DataColumn(
                          //         label: Text("Reason"),
                          //       ),
                          //       DataColumn(
                          //         label: Text("Status"),
                          //       ),
                          //       DataColumn(
                          //         label: Text("Approved by"),
                          //       ),
                          //       DataColumn(
                          //         label: Text("Actions"),
                          //       ),
                          //     ],
                          //     source: _data,
                          //     columnSpacing: 50,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
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
              accountName: TextWidget(
                  textValue: "Amal Naroth", fontColors: Colors.white),
              accountEmail: TextWidget(
                  textValue: "amalnaroth@", fontColors: Colors.white),
              currentAccountPicture: ClipOval(
                child: Image.network(
                  "https://images.unsplash.com/photo-1704981103922-3d80a026922e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Attendence"),
                onTap: () =>
                    NavigatorService.popAndPushNamed(AppRoutes.attendence),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text("Leave"),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(200, (index) {
    return {
      "Leave Type": "Casual Leave",
      "From": "8 Mar 2023",
      "To": '9 Mar 2023',
      "No of Days": "2 days",
      "Reason": "Goining to Hospital",
      "Status": "New",
      "Approved by": "Amal Naroth",
      "Action": "..."
    };
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(data[index]['Leave Type']),
      ),
      DataCell(
        Text(data[index]['From']),
      ),
      DataCell(
        Text(data[index]['To']),
      ),
      DataCell(
        Text(data[index]['No of Days']),
      ),
      DataCell(
        Text(data[index]['Reason']),
      ),
      DataCell(
        Text(data[index]['Status']),
      ),
      DataCell(
        Text(data[index]['Approved by']),
      ),
      DataCell(
        Text(data[index]['Action']),
      ),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
