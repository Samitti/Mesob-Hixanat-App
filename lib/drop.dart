import 'package:flutter/material.dart';

class Drag extends StatelessWidget {
  const Drag({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return DragTarget(onWillAccept: (data) {
      if (data == letter) {
        print('Accepted');
        return true;
      } else {
        print('Rejected');
        return false;
      }
    }, builder: (context, candidateData, rejectedData) {
      return Text(
        letter,
        style: Theme.of(context).textTheme.headline1,
      );
    });
  }
}
