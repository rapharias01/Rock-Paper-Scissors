import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/widgets/game_result.dart';
import 'package:pedrapapeltesoura/widgets/score_board.dart';
import 'package:pedrapapeltesoura/widgets/choice_button.dart';
import 'package:pedrapapeltesoura/models/game.dart';
import 'package:pedrapapeltesoura/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel e Tesoura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Game _game = Game();

  void _play(GameChoice userChoice) {
    setState(() {
      _game.play(userChoice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Pedra, Papel e Tesoura'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScoreBoard(
              wins: _game.wins,
              losses: _game.losses,
              draws: _game.draws,
            ),
            
            GameResult(
              userChoice: _game.userChoice,
              appChoice: _game.appChoice,
              result: _game.result,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceButton(
                  choice: GameChoice.rock,
                  onTap: _play,
                ),
                ChoiceButton(
                  choice: GameChoice.paper,
                  onTap: _play,
                ),
                ChoiceButton(
                  choice: GameChoice.scissors,
                  onTap: _play,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}