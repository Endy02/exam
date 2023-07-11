import 'package:flutter/material.dart';
import 'package:mobile/Screens/order/order.dart';
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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Body(),
    Text(
      'Menu',
      style: optionStyle,
    ),
    Order()
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
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Cart',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
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
