// ignore_for_file: prefer_const_constructors, unused_import, non_constant_identifier_names
import 'package:flutter/material.dart';
import '../dados/date.dart';
import '../models/comidas.dart';
import 'componentes/card_meals.dart';
import 'componentes/list_meals.dart';
import 'componentes/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Comidas> carrinho_card = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        child: Column(
          children: [
            Menu(
              comidas: carrinho_card,
            ),
            listMeals(mealscomidas: ele_Category),
            Divider(),
            meals_Card(
              meals: listComidas,
              ontap_Favoritos: (a) {
                bool elemntos= carrinho_card.contains(listComidas[a]);
                setState(() {
                 if (elemntos == false) {
                   carrinho_card.add(listComidas[a]);
                 }
                  
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
