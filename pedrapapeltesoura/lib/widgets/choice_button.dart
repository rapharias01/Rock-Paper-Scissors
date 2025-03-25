import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/utils/constants.dart';

class ChoiceButton extends StatelessWidget {
  final GameChoice choice;
  final Function(GameChoice) onTap;

  const ChoiceButton({
    super.key,
    required this.choice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(choice),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(128, 128, 128, 0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Image.asset(
          choice.assetPath,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}