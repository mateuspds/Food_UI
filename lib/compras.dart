// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodscren/Screen/componentes/icon_delete_add_compras.dart';
import 'package:foodscren/Screen/componentes/sizeboxCompras.dart';
import 'package:foodscren/models/provider.dart';
import 'package:provider/provider.dart';

class Compras extends StatefulWidget {
  const Compras({Key? key}) : super(key: key);

  @override
  State<Compras> createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  @override
  Widget build(BuildContext context) {
    final lista_Compras = Provider.of<Listprodutos>(context);

    double valor_Total = 0;

    for (var i = 0; i < lista_Compras.carrinho.length; i++) {
      double valor = 0;
      var a = lista_Compras.carrinho[i].quantidade;
      var b = lista_Compras.carrinho[i].preco;
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
          sizeboxCompras(),
          //adicionar as refeiçoes na tela
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: lista_Compras.carrinho.length,
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
                                lista_Compras.carrinho[index].imageUrl,
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
                                  lista_Compras.carrinho[index].title,
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
                                  lista_Compras.removeCarrinho(index);
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
                              '\$${lista_Compras.carrinho[index].preco.toString()}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // quantidade de comidas
                          IconDeleteAdd(
                              iconsv: Icons.remove,
                              ontap: () {
                                if (lista_Compras.carrinho[index].quantidade >
                                    1) {
                                  setState(
                                    () {
                                      lista_Compras.carrinho[index]
                                          .quantidadeaimento = lista_Compras
                                              .carrinho[index].quantidade -
                                          1;
                                    },
                                  );
                                }
                              },
                              direita: 160,
                              baixo: 10),
                          Positioned(
                              bottom: 10,
                              right: 130,
                              child: Text(
                                lista_Compras.carrinho[index].quantidade
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                          IconDeleteAdd(
                              iconsv: Icons.add,
                              ontap: () {
                                setState(
                                  () {
                                    lista_Compras.carrinho[index]
                                        .quantidadeaimento = lista_Compras
                                            .carrinho[index].quantidade +
                                        1;
                                  },
                                );
                              },
                              direita: 90,
                              baixo: 10)
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
                          onSurface: const Color.fromARGB(255, 214, 213, 196),
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
                        style: const TextStyle(
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
}
