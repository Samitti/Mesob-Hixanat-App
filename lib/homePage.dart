import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  List<String> _words = allWords.toList();
  late String _word;
  late String _dropedWord;

  @override
  @override
  void initState() {
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    _dropedWord = _words[r];
    final s = _word.characters.toList()..shuffle();
    _word = s.join();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setUp(total: _word.length);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
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
                    .map((e) => Drop(
                          letter: e,
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(color: Colors.green),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _word.characters
                    .map((e) => Drag(
                          letter: e,
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
