enum GameChoice { rock, paper, scissors }

extension GameChoiceExtension on GameChoice {
  String get assetPath {
    switch (this) {
      case GameChoice.rock:
        return 'assets/images/pedra.png';
      case GameChoice.paper:
        return 'assets/images/papel.png';
      case GameChoice.scissors:
        return 'assets/images/tesoura.png';
    }
  }
  
  String get name {
    switch (this) {
      case GameChoice.rock:
        return 'Pedra';
      case GameChoice.paper:
        return 'Papel';
      case GameChoice.scissors:
        return 'Tesoura';
    }
  }
}