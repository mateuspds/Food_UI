import 'package:flutter/material.dart';
import '../../Routes/routes.dart';
import '../../models/comidas.dart';

class Menu extends StatelessWidget {
  final List<Comidas> comidas;
  const Menu({Key? key, required this.comidas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const Text(
            'MENU',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              IconButton(
                onPressed: () {
                  if (comidas.isNotEmpty) {
                    Navigator.of(context)
                        .pushNamed(Rotas.Compras);
                  } 
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                  // ignore: prefer_const_constructors
                  child: Text(
                    comidas.length.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
