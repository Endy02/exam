import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            '../../assets/images/home_page_banner.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.0), // Ajout de la marge supérieure
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: 2.0, right: 2.0), // Ajout de la marge supérieure et de la marge à droite
                      child: Image.asset(
                        '../../assets/images/5a38c81c0bc467.9075323715136706840482.png',
                        width: 100.0,
                        height: 68.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Le Royale Burger',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        decoration: TextDecoration.none,

                      ),
                    ),
                  ),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    child: Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.orange,
      child: Column(
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

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(),
          FeatureSection(),
          SizedBox(height: 16.0), // Ajouter un espace vertical de 16.0 pixels
          MenuPage3(products: products)
        ],
      ),
    );
  }
}



class MenuPage3 extends StatelessWidget {
  final List<Product> products;


  MenuPage3({required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing:10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

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
                child: Divider(
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

  DCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child:Container(
          child: Column(
            children: [
              GestureDetector(
                // onTap: handleClick,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    '../../assets/images/burgercamere.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                  product.nom,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none,

                  )
              ),
              Text(
                'Double steak, cheese, bacon, pickles, homemade sauce, cereals bread.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                '${product.prix} €',
                style: TextStyle(
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
    "description": "Délicieux burger avec du fromage, des oignons et de la sauce spéciale",
    "prix": 9.99
  },
  {
    "nom": "Burger Deluxe",
    "description": "Délicieux burger avec du fromage, des oignons et de la sauce spéciale",
    "prix": 9.99
  },
  {
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },
  {
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },{
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },{
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },{
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },{
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },{
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },{
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
    "prix": 7.99
  },{
    "nom": "Salade César",
    "description": "Salade fraîche avec de la laitue, des croûtons et du poulet grillé",
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
