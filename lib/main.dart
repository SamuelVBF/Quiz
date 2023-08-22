import 'package:flutter/material.dart';
import 'package:projeto_quiz/questionario.dart';
import 'resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 4},
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Branco', 'pontuacao': 6},
        {'texto': 'Rosa', 'pontuacao': 7},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Cutia', 'pontuacao': 4},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Gato', 'pontuacao': 6},
        {'texto': 'Girafa', 'pontuacao': 7},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 4},
        {'texto': 'Carol', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 6},
        {'texto': 'Leo', 'pontuacao': 7},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelec) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelec {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Perguntas')),
        body: temPerguntaSelec
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelec: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resutado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
