import 'package:flutter/material.dart';
import 'package:projeto_quiz/questao.dart';
import 'package:projeto_quiz/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelec;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelec,
    required this.quandoResponder,
  });

  bool get temPerguntaSelec {
    return perguntaSelec < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelec
        ? perguntas[perguntaSelec].cast()['respostas']
        : null;
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelec]['texto'].toString()),
        ...respostas
            .map((resp) {
          return Resposta(
            resp['texto'].toString(),
                () =>
                quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
