import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 6) {
      return 'Melhor dar uma olhadinha no mapa do OM. rs';
    } else if (pontuacao < 16) {
      return 'Foi bem, mas pode melhorar!';
    } else if (pontuacao < 26) {
      return 'Foi muito bem, mas não o suficiente. Tente novamente...';
    } else if (pontuacao < 36) {
      return 'Você tem um bom conhecimento sobre o OM, mas pode melhorar!';
    } else {
      return 'Acertou tudo!! Você deve ser Árabe!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 22),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 12),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
