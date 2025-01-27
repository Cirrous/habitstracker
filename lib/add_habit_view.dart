import 'package:flutter/material.dart';

class AddHabitView extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddHabit;

  const AddHabitView({super.key, required this.onAddHabit});

  @override
  State<AddHabitView> createState() => _AddHabitViewState();
}

class _AddHabitViewState extends State<AddHabitView> {
  final _formKey = GlobalKey<FormState>();
  String _taskTitle = '';
  String _notes = '';
  bool _isPositive = true;
  String _difficulty = 'Super Easy';
  String _frequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neue Gewohnheit hinzufügen'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Task Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte einen Task Title eingeben';
                  }
                  return null;
                },
                onSaved: (value) => _taskTitle = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Notes'),
                onSaved: (value) => _notes = value!,
              ),
              SwitchListTile(
                title: const Text('Positive Gewohnheit'),
                value: _isPositive,
                onChanged: (value) => setState(() => _isPositive = value),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Difficulty'),
                value: _difficulty,
                items: const ['Super Easy', 'Easy', 'Medium', 'Hard']
                    .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (value) => setState(() => _difficulty = value!),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Frequency'),
                value: _frequency,
                items: const ['Daily', 'Weekly', 'Monthly']
                    .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (value) => setState(() => _frequency = value!),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onAddHabit({ // Create a map here
                      'taskTitle': _taskTitle,
                      'notes': _notes,
                      'isPositive': _isPositive,
                      'difficulty': _difficulty,
                      'frequency': _frequency,
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Hinzufügen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}