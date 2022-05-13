import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './questionario.dart';
import './resultado.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlataform,);

  runApp(new PerguntaOrienteMedioApp());
  }
  
  class DefaultFirebaseOptions {
  }

class _PerguntaAppState extends State<PerguntaOrienteMedioApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual desses países do Oriente Médio (OM) NÃO são Árabe?',
      'respostas': [
        {'texto': 'Djibouti, Egito', 'pontuacao': 0},
        {'texto': 'Catar, Turquia', 'pontuacao': 5},
        {'texto': 'Turquia, Djibouti', 'pontuacao': 5},
        {'texto': 'Irã, Turquia', 'pontuacao': 10},
      ],
    },
    {
      'texto':
          'Qual dessas listas de países contém DOIS que NÃO fazem parte do OM?',
      'respostas': [
        {'texto': 'Djibouti, Líbia, Irã, Sudão, Iêmen, Mali', 'pontuacao': 5},
        {'texto': 'Turquia, Mali, Etiópia, Nigéria, Marrocos', 'pontuacao': 10},
        {'texto': 'Catar, Turquia, Israel, Arábia Saudita', 'pontuacao': 0},
        {'texto': 'Mali, Líbano, Siria, Chipre, Egito', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'O que a palavra "Marhaba" quer dizer?',
      'respostas': [
        {'texto': 'Oceâno', 'pontuacao': 0},
        {'texto': 'Mochila', 'pontuacao': 0},
        {'texto': 'Olá', 'pontuacao': 10},
        {'texto': 'Bem-vindo', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Qual dessas capitais do Oriente Médio está correta com o país indicado?',
      'respostas': [
        {'texto': 'Capital: Sanaã → País: Sudão', 'pontuacao': 0},
        {'texto': 'Capital: Bagdá → País: Líbano', 'pontuacao': 0},
        {'texto': 'Capital: Trípoli → País: Líbia', 'pontuacao': 10},
        {'texto': 'Capital: Atenas → País: Grécia', 'pontuacao': 5},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
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

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas sobre o Oriente Médio'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaOrienteMedioApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
