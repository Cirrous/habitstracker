  import 'package:flutter/material.dart';
  import 'habits_view.dart';
  import 'game_view.dart';
  import 'todo_view.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatefulWidget {
    const MyApp({super.key});

    @override
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
    int _selectedIndex = 0; // Index der aktuell ausgewählten View

    // Liste der Views, die angezeigt werden
    final List<Widget> _viewOptions = [
      HabitsView(),
      GameView(),
      TodoView(),
    ];

    // Methode zum Wechseln der View bei einem Tab
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'My App',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Habits Tracker'),
            backgroundColor: Colors.black54,
          ),
          body: Center(
            child: _viewOptions.elementAt(_selectedIndex), // Die ausgewählte View anzeigen
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_rounded),
                label: 'Habits',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.videogame_asset_outlined),
                label: 'Adventure',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: 'To Do\'s',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      );
    }
  }
