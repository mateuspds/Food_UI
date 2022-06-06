
enum Custo {
  barato,
  justo,
  caro,
}

enum Complexidade { facil, medium, dificil }

class Comidas {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final List<String> ingredientes;
  final List<String> passos;
  final int duration;
  final bool isGlutenFree;
  final bool isLactose;
  final bool isVegan;
  final bool isVegetarian;
  final Complexidade complexidade;
  final Custo custo;
  final double preco;
  final int estrela;
  final int avaliacao;
  int quantidade;
  Comidas(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.ingredientes,
      required this.passos,
      required this.duration,
      required this.isGlutenFree,
      required this.isLactose,
      required this.isVegan,
      required this.isVegetarian,
      required this.complexidade,
      required this.custo,
      required this.preco,
      required this.estrela,
      required this.avaliacao,
      this.quantidade = 1
      });
  set quantidadeaimento(int quant){
    quantidade = quant;
  }
  String get complexidadeText {
    switch (complexidade) {
      case Complexidade.facil:
        return 'facil';
      case Complexidade.medium:
        return 'medio';
      case Complexidade.dificil:
        return 'dificil';
      default:
        return 'desconhecida';
    }
  }

  String get custoText {
    switch (custo) {
      case Custo.barato:
        return 'Barato';
      case Custo.justo:
        return 'Justo';
      case Custo.caro:
        return 'Caro';
      default:
        return 'desconhecido';
    }
  }
}
