import 'package:flutter/material.dart';
import 'add_habit_view.dart';

class HabitsView extends StatefulWidget {
  const HabitsView({super.key});

  @override
  State<HabitsView> createState() => _HabitsViewState();
}

class _HabitsViewState extends State<HabitsView> {
  List<Map<String, dynamic>> habits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(habits[index]['taskTitle']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddHabitView(
                onAddHabit: (newHabit) => setState(() => habits.add(newHabit))
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

