// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../models/categoria.dart';

class listMeals extends StatelessWidget {
  final List<Categoria> mealscomidas;
  const listMeals({Key? key, required this.mealscomidas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealscomidas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: Text(
                mealscomidas[index].title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              selected: false,
              disabledColor: const Color.fromARGB(255, 245, 236, 236),
            ),
          );
        },
      ),
    );
  }
}
