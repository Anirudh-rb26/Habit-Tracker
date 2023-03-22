import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habittracker/utilities/habittiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // overall habit summary
  List habitList = [
    // [habitName, habitStarted(by default, 0), timeSpent(in seconds), timeGoal(in minutes)]
    ["Workout", false, 0, 1],
    ["DSA", false, 0, 1],
    ["Appdev", false, 0, 1],
    ["Sleep", false, 0, 1],
  ];

  void habitStarted(int index) {
    // grab starting time
    var startTime = DateTime.now();

    // grab elapsed time
    var elapsedTime = habitList[index][2];

    setState(() {
      // habit started or stopped
      habitList[index][1] = !habitList[index][1];
    });

    if (habitList[index][1]) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (!habitList[index][1]) {
            timer.cancel();
          }



          // calculate time elapsed
          var currentTime = DateTime.now();
          habitList[index][2] = elapsedTime + currentTime.second - startTime.second + 60 * (currentTime.minute - startTime.minute) + 60 * 60 * (currentTime.hour - startTime.hour);
        });
      });
    }
  }

  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Settings for " + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Consistency is Key.'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: habitList.length,
        itemBuilder: ((context, index) {
          return HabitTile(
            habitName: habitList[index][0],
            playTap: () {
              habitStarted(index);
            },
            settingsTap: () {
              settingsOpened(index);
            },
            habitStarted: habitList[index][1],
            timeSpent: habitList[index][2],
            timeGoal: habitList[index][3],
          );
        }),
      ),
    );
  }
}
