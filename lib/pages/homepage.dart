import 'package:flutter/material.dart';
import 'package:habittracker/utilities/habittiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Consistency is Key.'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          HabitTile(),
          HabitTile(),
          HabitTile(),
          HabitTile(),
          HabitTile(),
          HabitTile(),
        ],
      ),
    );
  }
}