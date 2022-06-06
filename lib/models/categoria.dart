import 'package:flutter/material.dart';
class Categoria {
  final String title;
  final Color color;
  final String id;
  const Categoria({
    required this.title,
    required this.id,
    this.color = Colors.deepPurple,
  });
}
