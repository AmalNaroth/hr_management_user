import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';
import 'package:intl/intl.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  late String currentTime;

  @override
  void initState() {
    super.initState();
    // Set up a timer to update the time every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
    // Initialize the time
    updateTime();
  }

  void updateTime() {
    // Get the current date and time
    DateTime now = DateTime.now();
    
    // Format the time as HH:mm:ss
    String formattedTime = DateFormat('HH:mm:ss').format(now);

    // Update the state to trigger a rebuild of the UI
    setState(() {
      currentTime = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        currentTime ?? 'Loading...',
        style: TextStyle(fontSize: 24,color: Colors.white),
      );
  }
}