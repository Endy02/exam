import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const MENU_URL = 'https://api.example.com/products';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool click = false;
  String errMsg = '';
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // Simuler une attente de 2 secondes pour simuler une requête API
    await Future.delayed(Duration(seconds: 2));

    // Produits fictifs
    final fakeProducts = [
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
    ];

    setState(() {
      products = fakeProducts;
    });
  }

/*
  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(MENU_URL));
      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body);
        });
      } else {
        // Gestion des erreurs
        setState(() {
          errMsg = 'Erreur lors de la récupération des produits.';
        });
      }
    } catch (error) {
      setState(() {
        errMsg = 'Erreur lors de la récupération des produits : $error';
      });
    }
  }
*/
  Widget productModal(String name, double price) {
    return GestureDetector(
      onTap: () {
        setState(() {
          click = !click;
        });
      },
      child: Container(
        // TODO: Implémenter la modal
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: Ajouter un widget BannerMenu
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // TODO: Ajouter la liste des produits
                        Column(
                          children: products.map((product) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  click = !click;
                                });
                              },
                              child: Container(
                                // TODO: Implémenter le widget d-card
                                margin: EdgeInsets.only(bottom: 16.0),
                                child: Card(
                                  color: Colors.green,
                                  child: ListTile(
                                    title: Text(product['nom'],
                                        style: const TextStyle(
                                            color: Colors.white),),
                                    subtitle: Text(product['description'],
                                      style: const TextStyle(
                                          color: Colors.white)
                                    ),
                                    trailing: Text('\$${product['prix']}'),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        // TODO: Ajouter le séparateur
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}