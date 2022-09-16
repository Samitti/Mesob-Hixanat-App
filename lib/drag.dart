import 'package:flutter/material.dart';

class Drag extends StatelessWidget {
  const Drag({
    required this.letter,
    Key? key,
  }) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: letter,
      feedback: Text(
        letter,
        style: Theme.of(context).textTheme.headline1,
      ),
      child: Text(
        letter,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
