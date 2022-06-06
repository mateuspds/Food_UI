// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../models/comidas.dart';
import 'estrelas.dart';

class meals_Card extends StatelessWidget {
  final List<Comidas> meals;
  final Function(int) ontap_Favoritos;
  const meals_Card(
      {Key? key, required this.meals, required this.ontap_Favoritos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate:const  SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              // mainAxisExtent: 200,
            ),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.network(
                        meals[index].imageUrl,
                        fit: BoxFit.fitHeight,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                    //title the meals
                    Positioned(
                      width: 100,
                      height: 50,
                      bottom: 50,
                      left: 10,
                      child: Text(
                        meals[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.white,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    //title the money
                    Positioned(
                        bottom: 5,
                        left: 10,
                        child: Text(
                          '\$ ${meals[index].preco.toStringAsPrecision(4)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white,
                              color: Colors.black,
                              fontSize: 18),
                        )),
                    Positioned(
                      bottom: 2,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          ontap_Favoritos(index);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(7)),
                            //color: Colors.yellow,
                            child: const Icon(
                              Icons.add_outlined,
                              color: Colors.black,
                            )),
                      ),
                    ),

                    Star(
                      bottom: 30,
                      lefth: 5,
                      estrelas: meals[index].estrela,
                      avaliacao: meals[index].avaliacao,
                    ),
                  ],
                ),
              );
            }));
  }
}
