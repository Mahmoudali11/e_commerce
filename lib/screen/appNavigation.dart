 

import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/usersScreen.dart';
import 'package:flutter/material.dart';

 

/// This is the stateful widget that the main application instantiates.
class AppNaigation extends StatefulWidget {
 
  @override
  State<AppNaigation > createState() => _AppNaigationState();
}

 class _AppNaigationState extends State<AppNaigation > {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
  MyHomePage(),
  UsersScreen(),

  

   
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
           ),
          
          
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chating',
           ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap:(v){
          _onItemTapped(v);

        },
      ),
    );
  }
}
