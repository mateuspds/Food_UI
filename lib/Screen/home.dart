// ignore_for_file: prefer_const_constructors, unused_import, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:foodscren/models/provider.dart';
import 'package:provider/provider.dart';
import '../dados/date.dart';
import '../models/comidas.dart';
import 'componentes/card_meals.dart';
import 'componentes/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final carrinho_card = Provider.of<Listprodutos>(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        child: Column(
          children: [
            Menu(
              comidas: carrinho_card.carrinho,
            ),
            Divider(),
            meals_Card(
              meals: listComidas,
              ontap_Favoritos: (a) {
                bool listadecompra =
                    carrinho_card.carrinho.contains(listComidas[a]);
                if (listadecompra == false) {
                  carrinho_card.addCarrinho(listComidas[a]);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
