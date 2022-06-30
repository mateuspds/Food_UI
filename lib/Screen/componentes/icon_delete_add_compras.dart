import 'package:flutter/material.dart';

class IconDeleteAdd extends StatelessWidget {
  final IconData iconsv;
  final VoidCallback ontap;
  final double direita;
  final double baixo;
  const IconDeleteAdd({
    Key? key,
    required this.iconsv,
    required this.ontap,
    required this.direita,
    required this.baixo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
