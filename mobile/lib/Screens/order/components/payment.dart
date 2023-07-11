import 'package:flutter/material.dart';
import 'package:mobile/Screens/order/components/recap.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paiement'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
            16.0), // Ajoutez un padding de 16.0 sur tous les côtés
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Paiement',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Numéro de carte',
              ),
            ),
            const SizedBox(height: 8.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'CCV',
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mois',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  flex: 3,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Année',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Nom et prénom du titulaire',
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const RecapPage()), // Remplacez AnotherScreen par le composant de destination que vous souhaitez afficher
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
                  'Suivant',
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
    );
  }
}
