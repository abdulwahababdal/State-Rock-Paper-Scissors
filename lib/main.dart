import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String player1Choice = '';
  String player2Choice = '';
  String result = 'Battle!'; 
  final List<String> options = [
    'assets/rock.png',
    'assets/paper.png',
    'assets/scissors.png',
  ];

  void _setPlayerChoice(int player) {
    final randomIndex = Random().nextInt(options.length);
    setState(() {
      if (player == 1) {
        player1Choice = options[randomIndex];
      } else {
        player2Choice = options[randomIndex];
      }

      if (player1Choice.isNotEmpty && player2Choice.isNotEmpty) {
        _determineWinner();
      }
    });
  }

  void _determineWinner() {
    if (player1Choice == player2Choice) {
      result = 'It\'s a tie!';
    } else if ((player1Choice == 'assets/rock.png' && player2Choice == 'assets/scissors.png') ||
               (player1Choice == 'assets/scissors.png' && player2Choice == 'assets/paper.png') ||
               (player1Choice == 'assets/paper.png' && player2Choice == 'assets/rock.png')) {
      result = 'Player 1 wins!';
    } else {
      result = 'Player 2 wins!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 232, 209),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 254, 146, 13),
          title: const Text(
            'Rock Paper Scissors',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    player1Choice.isNotEmpty
                        ? Image.asset(player1Choice, height: 200)
                        : const SizedBox(height: 200, width: 100, child: Placeholder()),
                    player2Choice.isNotEmpty
                        ? Image.asset(player2Choice, height: 200)
                        : const SizedBox(height: 200, width: 100, child: Placeholder()),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  result,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _setPlayerChoice(1);
                    _setPlayerChoice(2);
                  },
                  child: const Text('Play'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

