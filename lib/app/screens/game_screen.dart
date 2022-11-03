import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:spelling_bee/app/widgets/progress_bar.dart';
import '../widgets/fly_in_animation.dart';
import '../widgets/drop.dart';
import '../controllers/all_words.dart';
import '../widgets/drag.dart';
import '../controllers/controller.dart';

class GameScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const GameScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double offset = 0;
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
      Provider.of<Controller>(context, listen: false)
          .setNewWord(newWords: _dropedWord);
    });
  }

  _animationCompleted() {
    Future.delayed(const Duration(microseconds: 200), () {
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
              Stack(
                children: [
                  Container(
                    // color: Colors.lightBlue,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 35, 8, 97),
                      image: DecorationImage(
                        opacity: 0.5,
                        image: AssetImage(
                          'assets/images/bg-bottom.png',
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.lightBlue,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.5,
                        image: AssetImage(
                          'assets/images/bg-top-0.png',
                        ),
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<Controller>(context, listen: false)
                              .reset();
                          HapticFeedback.lightImpact();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                              'assets/images/button_previous_04.png'),
                        ),
                      ),
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 129, 83, 247),
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
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
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18.0, 2, 2, 2),
                                child: FittedBox(
                                  child: Text(
                                    'መሶብ ግድላት',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
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
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 4,
                    child: FlyInAnimation(
                      animate: true,
                      child: Image.asset('assets/images/game/$_dropedWord.png'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                    flex: 2,
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
