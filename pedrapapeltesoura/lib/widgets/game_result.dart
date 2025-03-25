import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/utils/constants.dart';
import 'package:pedrapapeltesoura/models/game.dart';

class GameResult extends StatelessWidget {
  final GameChoice? userChoice;
  final GameChoice? appChoice;
  final GameOutcome? result;

  const GameResult({
    super.key,
    this.userChoice,
    this.appChoice,
    this.result,
  });

  Color _getBorderColor(bool isUser) {
    if (result == null) return Colors.transparent;
    if (result == GameOutcome.draw) return Colors.orange;
    
    if (isUser) {
      return result == GameOutcome.win ? Colors.green : Colors.transparent;
    } else {
      return result == GameOutcome.lose ? Colors.green : Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Disputa',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Você'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _getBorderColor(true),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(128, 128, 128, 0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: userChoice != null
                      ? Image.asset(
                          userChoice!.assetPath,
                          width: 80,
                          height: 80,
                        )
                      : const SizedBox(width: 80, height: 80),
                ),
                const SizedBox(height: 10),
                Text(userChoice?.name ?? ''),
              ],
            ),
            Column(
              children: [
                const Text('App'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _getBorderColor(false),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(128, 128, 128, 0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: appChoice != null
                      ? Image.asset(
                          appChoice!.assetPath,
                          width: 80,
                          height: 80,
                        )
                      : const SizedBox(width: 80, height: 80),
                ),
                const SizedBox(height: 10),
                Text(appChoice?.name ?? ''),
              ],
            ),
          ],
        ),
      ],
    );
  }
}