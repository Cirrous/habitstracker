import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_habit_view.dart';
import 'habits_model.dart';

class HabitsView extends StatefulWidget {
  const HabitsView({super.key});

  @override
  State<HabitsView> createState() => _HabitsViewState();
}

class _HabitsViewState extends State<HabitsView> {
  List<Map<String, dynamic>> habits = [];
  @override
  Widget build(BuildContext context) {
    final habitsModel = Provider.of<HabitsModel>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: habitsModel.habits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(habitsModel.habits[index]['taskTitle']),
            subtitle: Text(habitsModel.habits[index]['notes']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddHabitView(
                onAddHabit: (newHabit) {
                  habitsModel.addHabit(newHabit);
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

