import 'package:flutter/material.dart';
import 'package:tictactoe/constants/color.dart';
import 'package:tictactoe/constants/text_style.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> xoDisplay = [
    '', // 0
    '', // 1
    '', // 1
    '', // 3
    '', // 4
    '', // 5
    '', // 6
    '', // 7
    '', // 8
  ];
  bool onTurn = true;
  bool winner = false;
  int scoreX = 0;
  int scoreY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.redColor,
      appBar: AppBar(
        backgroundColor: MyColors.orangeColor,
        toolbarHeight: 100,
        title: const Text(
          'Tic Tac Toe',
          style: CustomTextStyle.bigText,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Player X:  $scoreX',
                    style: CustomTextStyle.mediumText,
                  ),
                  Text(
                    'Player O:  $scoreY',
                    style: CustomTextStyle.mediumText,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (winner) {
                      } else {
                        _tapGrid(index);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                          boxShadow: const [
                            BoxShadow(color: Colors.black, offset: Offset(2, 1))
                          ]),
                      child: Center(
                        child: Text(
                          xoDisplay[index],
                          style: CustomTextStyle.xoText,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: () {
                    _resetGame();
                  },
                  child: const Text(
                    'Play again',
                    style: CustomTextStyle.mediumText,
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: () {
                    _resetScore();
                  },
                  child: const Text(
                    'Reset Score',
                    style: CustomTextStyle.mediumText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _resetScore() {
    setState(() {
      scoreX = 0;
      scoreY = 0;
    });
  }

  void _tapGrid(int index) {
    setState(
      () {
        if (onTurn && xoDisplay[index].isEmpty) {
          xoDisplay[index] = 'O';
          onTurn = !onTurn;
        } else if (!onTurn && xoDisplay[index].isEmpty) {
          xoDisplay[index] = 'X';
          onTurn = !onTurn;
        }
        _checkWin();
      },
    );
  }

  void _checkWin() {
    if (xoDisplay[0] == xoDisplay[1] &&
        xoDisplay[0] == xoDisplay[2] &&
        xoDisplay[0].isNotEmpty) {
      winner = true;
      if (xoDisplay[0] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    } else if (xoDisplay[3] == xoDisplay[4] &&
        xoDisplay[3] == xoDisplay[5] &&
        xoDisplay[3].isNotEmpty) {
      winner = true;
      if (xoDisplay[3] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    } else if (xoDisplay[6] == xoDisplay[7] &&
        xoDisplay[6] == xoDisplay[8] &&
        xoDisplay[6].isNotEmpty) {
      winner = true;
      if (xoDisplay[6] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    } else if (xoDisplay[0] == xoDisplay[3] &&
        xoDisplay[0] == xoDisplay[6] &&
        xoDisplay[0].isNotEmpty) {
      winner = true;
      if (xoDisplay[0] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    } else if (xoDisplay[1] == xoDisplay[4] &&
        xoDisplay[1] == xoDisplay[7] &&
        xoDisplay[1].isNotEmpty) {
      winner = true;
      if (xoDisplay[1] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    } else if (xoDisplay[2] == xoDisplay[5] &&
        xoDisplay[2] == xoDisplay[8] &&
        xoDisplay[2].isNotEmpty) {
      winner = true;
      if (xoDisplay[2] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    } else if (xoDisplay[0] == xoDisplay[4] &&
        xoDisplay[0] == xoDisplay[8] &&
        xoDisplay[0].isNotEmpty) {
      winner = true;
      if (xoDisplay[0] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    } else if (xoDisplay[2] == xoDisplay[4] &&
        xoDisplay[2] == xoDisplay[6] &&
        xoDisplay[2].isNotEmpty) {
      winner = true;
      if (xoDisplay[2] == 'X') {
        scoreX++;
      } else {
        scoreY++;
      }
    }
  }

  void _resetGame() {
    setState(() {
      xoDisplay = List.filled(9, '');
      onTurn = true;
      winner = false;
    });
  }
}
