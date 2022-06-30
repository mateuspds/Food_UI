import 'package:flutter/foundation.dart';
import 'package:foodscren/dados/date.dart';
import 'package:provider/provider.dart';
import 'package:foodscren/models/comidas.dart';

class Listprodutos with ChangeNotifier {

  List<Comidas> _itens = listComidas;

  List<Comidas> carrinho = [];

  List<Comidas> get itens => [..._itens];

  void addCarrinho(Comidas comidas) {
    carrinho.add(comidas);
    notifyListeners();
  }

  void removeCarrinho(int index) {
    carrinho.removeAt(index);
    notifyListeners();
  }
}
