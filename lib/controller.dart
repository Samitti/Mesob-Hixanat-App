import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import './allWords.dart';
import './messageBox.dart';

class Controller extends ChangeNotifier {
  int totalletters = 0, lettersAnswered = 0, wordsAnswered = 0;
  bool generateWord = true, sessionCompleted = false, letterDropped = false;
  double percentCompleted = 0;
  setUp({required int total}) {
    lettersAnswered = 0;
    totalletters = total;
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    updateLetterDroped(dropped: true);
    if (lettersAnswered == totalletters) {
      wordsAnswered++;
      AudioCache().play("audio/correct_2.mp3");
      percentCompleted = wordsAnswered / allWords.length;
      if (wordsAnswered == allWords.length) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox(
                sessionCompleted: sessionCompleted,
              ));
    } else {
      AudioCache().play("audio/correct_1.mp3");
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
  }

  updateLetterDroped({required bool dropped}) {
    letterDropped = dropped;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordsAnswered = 0;
    generateWord = true;
    percentCompleted = 0;
  }
}
