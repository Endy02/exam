import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // Total size Height and width of screen
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset("assets/images/home_page_banner.jpg")),
            ]),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        "assets/images/burger.png",
                        width: 120,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Column(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: SizedBox(
                                width: 190,
                                child: Text("Bienvenue sur myResto",
                                    style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700)))),
                        SizedBox(
                            width: 190,
                            child: Text(
                                "Découvrez l'ensemble de notre menu pour ravivez la flamme en vous, choisir MyResto, c'est sortir avec le ventre plein.",
                                style:
                                    TextStyle(color: darkGrey, fontSize: 15))),
                      ]),
                    ),
                  ])),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset("assets/images/presentation.jpg")),
            ]),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Column(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: SizedBox(
                                width: 190,
                                child: Text(
                                    "Rester à jour sur les nouveautées.",
                                    style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700)))),
                        SizedBox(
                            width: 190,
                            child: Text(
                                "Notre menu, composé de spécialitée americaine et exotique vous fera voyagé grâce a des saveurs hors du commun.",
                                style:
                                    TextStyle(color: darkGrey, fontSize: 15))),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset(
                        "assets/images/burger.png",
                        width: 120,
                      ),
                    ),
                  ])),
          const Padding(
              padding:
                  EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 60),
              child: SizedBox(
                  child: Text("Commander en toute securité.",
                      style: TextStyle(
                          color: darkGrey,
                          fontSize: 17,
                          fontWeight: FontWeight.w700)))),
          const SizedBox(
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 60),
                  child: Text(
                      "Notre platforme de paiement, dispose d'une couche de sécurité supplémentaire offre au utilisateurs, l'opportunité de commander en toute sécurité.",
                      style: TextStyle(color: darkGrey, fontSize: 15)))),
        ],
      ),
    );
  }
}
