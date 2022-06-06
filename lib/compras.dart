// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodscren/models/comidas.dart';

class Compras extends StatefulWidget {
  const Compras({Key? key}) : super(key: key);

  @override
  State<Compras> createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  @override
  Widget build(BuildContext context) {
    final lista_Compras =
        ModalRoute.of(context)!.settings.arguments as List<Comidas>;
    double valor_Total = 0;
    for (var i = 0; i < lista_Compras.length; i++) {
      double valor = 0;
      var a = lista_Compras[i].quantidade;
      var b = lista_Compras[i].preco;
      valor = a * b;
      valor_Total = valor_Total + valor;
    }

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  'Voltar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Text(
                  'Cartão',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 25, 10, 10),
                child: Text(
                  'Monday, 26 th of August',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 25, 10, 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.add),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  ),
                  const Text(
                    'Add Refeição',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          //adicionar as refeiçoes na tela
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: lista_Compras.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 2,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 7,
                            bottom: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                lista_Compras[index].imageUrl,
                                fit: BoxFit.fitHeight,
                                width: 120,
                                height: 90,
                              ),
                            ),
                          ),
                          //title
                          Positioned(
                              left: 140,
                              top: 15,
                              child: SizedBox(
                                width: 130,
                                height: 50,
                                child: Text(
                                  lista_Compras[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              )),
                          //remove
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  lista_Compras.removeAt(index);
                                });
                              },
                              child: const Icon(
                                Icons.delete_sweep,
                                size: 26,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          //preço
                          Positioned(
                            right: 5,
                            top: 20,
                            child: Text(
                              '\$${lista_Compras[index].preco.toString()}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // quantidade de comidas
                          icon_ADD_Remove(Icons.remove, () {
                            if (lista_Compras[index].quantidade > 1) {
                              setState(() {
                                lista_Compras[index].quantidadeaimento =
                                    lista_Compras[index].quantidade - 1;
                              });
                            }
                          }, 160, 10),
                          Positioned(
                              bottom: 10,
                              right: 130,
                              child: Text(
                                lista_Compras[index].quantidade.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          icon_ADD_Remove(Icons.add, () {
                            setState(() {
                              lista_Compras[index].quantidadeaimento =
                                  lista_Compras[index].quantidade + 1;
                            });
                          }, 90, 10)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 110,
            child: Card(
                elevation: 5,
                child: Stack(
                  children: [
                    const Positioned(
                      left: 10,
                      top: 10,
                      child: Text(
                        "Total:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 0,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: const Color.fromARGB(255, 226, 219, 13),
                          onSurface:const Color.fromARGB(255, 214, 213, 196),
                          elevation: 20,
                          minimumSize: const Size(300, 50),
                          shadowColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text(
                          'Pagar',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //valor
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Text(
                        "\$ ${valor_Total.toStringAsPrecision(4)} ",
                        style:const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget icon_ADD_Remove(
      IconData iconsv, VoidCallback ontap, double direita, double baixo) {
    return Positioned(
      right: direita,
      bottom: baixo,
      child: InkWell(
        onTap: ontap,
        child: CircleAvatar(
          maxRadius: 10,
          backgroundColor: Colors.black,
          child: Icon(
            iconsv,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
