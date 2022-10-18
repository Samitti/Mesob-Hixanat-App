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

  _animationCompleted() {
    Future.delayed(Duration(microseconds: 200), () {
      Provider.of<Controller>(context, listen: false)
          .updateLetterDroped(dropped: false);
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
          child: Stack(
            children: [
              Container(
                color: Colors.lightBlue,
              ),
              Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18.0, 2, 2, 2),
                                child: FittedBox(
                                  child: Text(
                                    'መሶብ ፊደላት',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Selector<Controller, bool>(
                                  selector: (_, controller) =>
                                      controller.letterDropped,
                                  builder: (_, dropped, __) => FlyInAnimation(
                                      removeScale: true,
                                      animate: dropped,
                                      animationCompleted: _animationCompleted,
                                      child: Image.asset(
                                          'assets/images/mesob_logo.png')),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ),
                  Expanded(
                    flex: 4,
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
                  Expanded(
                    flex: 4,
                    child: FlyInAnimation(
                      animate: true,
                      child: Image.asset('assets/images/$_dropedWord.png'),
                    ),
                  ),
                  Expanded(
                    flex: 4,
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
                  const Expanded(
                    flex: 1,
                    child: ProgressBar(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
