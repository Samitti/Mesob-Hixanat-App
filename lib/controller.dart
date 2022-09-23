import 'package:flutter/material.dart';
import './messageBox.dart';

class Controller extends ChangeNotifier {
  int totalletters = 0, lettersAnswered = 0;
  bool generateWord = false;

  setUp({required int total}) {
    totalletters = total;
    print('total letters $totalletters');
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    if (lettersAnswered == totalletters) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox());
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
  }
}
