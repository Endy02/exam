import 'package:flutter/material.dart';
import 'package:mobile/Screens/admin/admin.dart';
import 'package:mobile/Screens/menu/menu.dart';
import 'package:mobile/Screens/order/order.dart';
import 'package:mobile/Screens/user/login.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/Screens/home/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Body(),
    MenuPage2(),
    OrderPage2()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset("assets/images/logo_myresto.svg")),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.supervised_user_circle),
            tooltip: 'User settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Login()), // Remplacez AnotherScreen par le composant de destination que vous souhaitez afficher
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: 'Admin pannel',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Dashboard()), // Remplacez AnotherScreen par le composant de destination que vous souhaitez afficher
              );
            },
          ),
        ],
      ),
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
            icon: Icon(Icons.collections_bookmark_rounded),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_mode_rounded),
            label: 'Commander',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: creamOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}
