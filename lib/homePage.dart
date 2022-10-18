import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_bee/progressBar.dart';
import './flyInAnimation.dart';
import './drop.dart';
import './allWords.dart';
import './drag.dart';
import './controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _words = allWords.toList();
  late String _word, _dropedWord;

  _generateWord() {
    // print("Words Left: ${_words.length}");
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    _dropedWord = _word;
    _words.removeAt(r);
    final s = _word.characters.toList()..shuffle();
    _word = s.join();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setUp(total: _word.length);
      Provider.of<Controller>(context, listen: false)
          .requestWord(request: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<Controller, bool>(
      selector: (_, controller) => controller.generateWord,
      builder: (_, generate, __) {
        if (generate) {
          if (_words.isNotEmpty) {
            _generateWord();
          }
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(color: Colors.red),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _dropedWord.characters
                        .map((e) => FlyInAnimation(
                              animate: true,
                              child: Drop(
                                letter: e,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FlyInAnimation(
                  animate: true,
                  child: Container(
                    color: Colors.green,
                    child: Image.asset('assets/images/$_dropedWord.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _word.characters
                        .map((e) => FlyInAnimation(
                              animate: true,
                              child: Drag(
                                letter: e,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: ProgressBar(),
              ),
            ],
          ),
        );
      },
    );
  }
}
