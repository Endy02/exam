import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 150,
      child: Container(


        child: ListView(
          children: [
            DrawerHeader(
              child: Text('MyResto'),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                // Naviguer vers la page du tableau de bord
              },
            ),

          ],
        ),
      ),
    );
  }
}
