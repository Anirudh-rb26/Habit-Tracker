import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback playTap;
  final VoidCallback settingsTap;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HabitTile({
    super.key,
    required this.habitName,
    required this.playTap,
    required this.settingsTap,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
  });

  String formatToMin(int totalSeconds) {
    String seconds = (totalSeconds % 60).toString();
    String minutes = (totalSeconds / 60).toStringAsFixed(5);

    // if seconds is 1 digit, place 0 before the digit
    if (seconds.length == 1) {
      seconds = '0' + seconds;
    }

    // if minutes is 1 digit
    // minutes = 0.9 then minutes = 0
    if (minutes[1] == '.') {
      minutes = minutes.substring(0, 1);
    }

    return minutes + ':' + seconds;
  }

  // caclulate progress percentage
  double percentCompleted() {
    return (timeSpent / (timeGoal * 60));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: playTap,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        CircularPercentIndicator(
                          radius: 30,
                          percent: percentCompleted() < 1 ? percentCompleted() : 1,
                          progressColor: percentCompleted() > 0.5 ? (percentCompleted() > 0.75 ? (percentCompleted() > 1 ? Colors.amber : Colors.green) : Colors.orange) : Colors.red,
                        ),
                        Center(
                          child: Icon(
                              habitStarted ? Icons.pause : Icons.play_arrow),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Habit Name
                    Text(
                      habitName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Habit Progress
                    Text(
                      formatToMin(timeSpent) + ' / ' + timeGoal.toString() + ' = ' + (percentCompleted()* 100).toStringAsFixed(0) + '%',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: settingsTap,
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
