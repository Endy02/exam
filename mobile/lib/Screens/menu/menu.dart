import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class HeroSection extends StatelessWidget {
  const HeroSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/home_page_banner.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2.0), // Ajout de la marge supérieure
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 2.0,
                          right:
                              2.0), // Ajout de la marge supérieure et de la marge à droite
                      child: Image.asset(
                        'assets/images/burger.png',
                        width: 100.0,
                        height: 68.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: darkGrey),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      'Le Royale Burger',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Ce burger est fait pour les amoureux de la viande et du hamburger maison, avec ses oignons et son bacon grillé, il vous fera saliver grâce à ses cornichons et sa sauce maison.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FeatureSection extends StatelessWidget {
  const FeatureSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.orange,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 40.0,
                child: Icon(
                  Icons.fastfood,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 40.0,
                child: Icon(
                  Icons.restaurant_menu,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 40.0,
                child: Icon(
                  Icons.local_drink,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 40.0,
                child: Icon(
                  Icons.local_dining,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class MenuPage2 extends StatelessWidget {
  const MenuPage2();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeroSection(),
          const FeatureSection(),
          MenuPage3(products: products)
        ],
      ),
    );
  }
}

class MenuPage3 extends StatelessWidget {
  final List<Product> products;

  const MenuPage3({required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: products.map((product) {
                    return GestureDetector(
                      //                    onTap: handleClick,
                      child: DCard(
                        product: product,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Divider(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavCard extends StatelessWidget {
  const NavCard();

  @override
  Widget build(BuildContext context) {
    return Container(
        // Your navigation card content
        // ...
        );
  }
}

class DCard extends StatelessWidget {
  final Product product;

  const DCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset(
                  'assets/images/burgercamere.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(product.nom,
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                )),
            const Text(
              'Double steak, cheese, bacon, pickles, homemade sauce, cereals bread.',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              '${product.prix} €',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String nom;
  final String description;
  final double prix;

  Product({required this.nom, required this.description, required this.prix});
}

List<Map<String, dynamic>> productList = [
  // Liste de produits existante
  {
    "nom": "Burger Deluxe",
    "description":
        "Délicieux burger avec du fromage, des oignons et de la sauce spéciale",
    "prix": 9.99
  },
  {
    "nom": "Burger Deluxe",
    "description":
        "Délicieux burger avec du fromage, des oignons et de la sauce spéciale",
    "prix": 9.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description":
        "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  // ... Ajoutez les autres produits ici
];

List<Product> products = productList.map((item) {
  return Product(
    nom: item['nom'],
    description: item['description'],
    prix: item['prix'],
  );
}).toList();
