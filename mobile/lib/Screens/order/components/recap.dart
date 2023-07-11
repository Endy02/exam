import 'package:flutter/material.dart';
import 'package:mobile/Screens/home/home.dart';

class RecapPage extends StatelessWidget {
  const RecapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Répatitulatif'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 48.0),
            child: Text(
              'Récapitulatif',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
          const SizedBox(height: 24.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 8.0), // Ajoute une marge horizontale de 16 pixels
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Commande N° 713702',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 8.0), // Ajoute une marge horizontale de 16 pixels
                child: Column(
                  children: [
                    Text(
                      'En cours de traitement',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: DataTable(
                columnSpacing: 16.0,
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.orange),
                columns: const [
                  DataColumn(
                    label: Text(
                      'Produits',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Quantité',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Prix',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Peachy Burger',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Double Steak, Fromage, Bacon, Cornichon, Sauce Maison, Pain céréale.',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          '1',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      DataCell(
                        Text(
                          '9,99 €',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Ajoute une marge horizontale de 16 pixels
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Code pour l'action du bouton "Confirmer"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Home()), // Remplacez AnotherScreen par le composant de destination que vous souhaitez afficher
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'Confirmer',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            height: 1.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
