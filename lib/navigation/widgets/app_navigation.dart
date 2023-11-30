import 'package:flutter/material.dart';
import 'package:gaaaaaa/character_hub/screens/CharacterFavorites.dart';
import 'package:gaaaaaa/character_hub/screens/CharacterSearch.dart';
import 'package:gaaaaaa/public/screens/Home.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    Home(),
    CharacterSearch(),
    CharacterFavorites(),
    
  ];

  void _navigateBottonNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Rick y morty temp 7'), backgroundColor: Color.fromARGB(255, 79, 219, 219)),

      body: _screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottonNavBar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Info'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Characters'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites'),
        ],
        backgroundColor: const Color.fromARGB(255, 79, 219, 219),
      )
    );
  }
}