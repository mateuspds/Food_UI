// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
class sizeboxCompras  extends StatelessWidget {
  const sizeboxCompras ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
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
          );
  }
}