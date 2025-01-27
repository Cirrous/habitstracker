import 'package:flutter/material.dart';

class HabitsView extends StatefulWidget {
  const HabitsView({super.key});

  @override
  State<HabitsView> createState() => _HabitsViewState();
}

class _HabitsViewState extends State<HabitsView> {
  List<String> habits = []; // Liste der Habits

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(habits[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddHabitDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddHabitDialog(BuildContext context) async {
    String newHabit = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Neue Gewohnheit hinzufügen'),
          content: TextField(
            onChanged: (value) {
              newHabit = value;
            },
            decoration: InputDecoration(hintText: 'Gewohnheit eingeben'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Abbrechen'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  habits.add(newHabit);
                });
                Navigator.of(context).pop();
              },
              child: Text('Hinzufügen'),
            ),
          ],
        );
      },
    );
  }
}