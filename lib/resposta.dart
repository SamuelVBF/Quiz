import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() whenSelection;

  Resposta(this.texto, this.whenSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        ),
        onPressed: whenSelection,
        child: Text(texto),
      ),
    );
  }
}
