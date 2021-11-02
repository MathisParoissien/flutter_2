import 'package:flutter/material.dart';
import 'package:Cook/pages/home.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
         _pages.elementAt(_selectedIndex),
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.style),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeBody(),
    Icon(
      Icons.favorite,
      size: 150,
    ),
    Icon(
      Icons.admin_panel_settings,
      size: 150,
    ),
  ];
}