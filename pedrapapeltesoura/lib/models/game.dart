import 'package:pedrapapeltesoura/utils/constants.dart';

enum GameOutcome { win, lose, draw }

class Game {
  GameChoice? userChoice;
  GameChoice? appChoice;
  GameOutcome? result;
  
  int wins = 0;
  int losses = 0;
  int draws = 0;
  
  void play(GameChoice choice) {
    userChoice = choice;
    appChoice = getRandomChoice();
    result = evaluateResult(userChoice!, appChoice!);
    
    switch (result) {
      case GameOutcome.win:
        wins++;
        break;
      case GameOutcome.lose:
        losses++;
        break;
      case GameOutcome.draw:
        draws++;
        break;
      default:
        break;
    }
  }
  
  GameChoice getRandomChoice() {
    final random = DateTime.now().millisecond % 3;
    return GameChoice.values[random];
  }
  
  GameOutcome evaluateResult(GameChoice user, GameChoice app) {
    if (user == app) return GameOutcome.draw;
    
    switch (user) {
      case GameChoice.rock:
        return app == GameChoice.scissors ? GameOutcome.win : GameOutcome.lose;
      case GameChoice.paper:
        return app == GameChoice.rock ? GameOutcome.win : GameOutcome.lose;
      case GameChoice.scissors:
        return app == GameChoice.paper ? GameOutcome.win : GameOutcome.lose;
    }
  }
}