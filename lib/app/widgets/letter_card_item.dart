import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class LetterCardItem extends StatelessWidget {
  final String letter;

  const LetterCardItem({
    Key? key,
    required this.letter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () => {AudioCache().play("audio/letters/$letter.mp3")},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            letter,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: 70.0,
                  letterSpacing: 4.0,
                ),
            softWrap: false,
          ),
        ),
      ),
    ));
  }
}
