import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final double bottom;
  final double lefth;
  final int estrelas;
  final int avaliacao;
  const Star(
      {Key? key,
      required this.bottom,
      required this.lefth,
      required this.estrelas,
      required this.avaliacao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: lefth,
      child: Row(children: [
        for (var i = 0; i < 5; i++)
          Icon(
            Icons.star,
            color: i < estrelas ? Colors.yellow : Colors.grey,
            size: 20,
          ),
        const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
        Text('(${avaliacao.toString()})', style:const TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),)
      ]),
    );
  }
}
