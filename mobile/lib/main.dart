import 'package:flutter/material.dart';
import 'package:mobile/Screens/commande/details-commande.dart';
import 'package:mobile/Screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Screens/Admin/dashboard.dart'; // Remplacez le chemin par le chemin correct vers votre fichier dashboard.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyResto',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      initialRoute: '/', // Définissez la route initiale ici, si nécessaire
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/commande': (context) => RecapPage(),
      },

    );
  }
}
