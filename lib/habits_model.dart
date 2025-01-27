import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HabitsModel extends ChangeNotifier {
  List<Map<String, dynamic>> _habits = [];

  HabitsModel() {
    _loadHabits();
  }

  List<Map<String, dynamic>> get habits => _habits;

  void addHabit(Map<String, dynamic> habit) {
    _habits.add(habit);
    _saveHabits();
    notifyListeners();
  }

  Future<void> _loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = prefs.getString('habits');
    if (habitsJson != null) {
      _habits = List<Map<String, dynamic>>.from(
        json.decode(habitsJson).map((x) => Map<String, dynamic>.from(x)),
      );
      notifyListeners();
    }
  }

  Future<void> _saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = json.encode(_habits);
    await prefs.setString('habits', habitsJson);
  }
}