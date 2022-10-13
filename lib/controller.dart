import 'package:flutter/material.dart';
import 'package:spelling_bee/allWords.dart';
import './messageBox.dart';

class Controller extends ChangeNotifier {
  int totalletters = 0, lettersAnswered = 0, wordsAnswered = 0;
  bool generateWord = true,
      sessionCompleted = false,
      letterDropped = false,
      generateWordList = false;

  setUp({required int total}) {
    totalletters = total;
    lettersAnswered = 0;
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    if (lettersAnswered == totalletters) {
      wordsAnswered++;
      if (wordsAnswered == allWords.length) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox(
                sessionCompleted: sessionCompleted,
              ));
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordsAnswered = 0;
    generateWord = true;
    generateWordList = true;
  }
}
