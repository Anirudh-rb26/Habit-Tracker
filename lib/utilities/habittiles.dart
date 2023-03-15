import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({super.key});

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
                CircularPercentIndicator(
                  radius: 30,
                  percent: 0.7,
                ),

                const SizedBox(width: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Habit Name
                    Text(
                      'Habit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Habit Progress
                    Text(
                      '2:00 / 10:00 = 20%',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
