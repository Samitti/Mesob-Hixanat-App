import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'letter_card_item.dart';

class LetterCard extends StatefulWidget {
  final List letterFamily;
  final Color primaryColor;
  final Color secondaryColor;

  const LetterCard({
    Key? key,
    required this.letterFamily,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<LetterCard> createState() => _LetterCardState();
}

class _LetterCardState extends State<LetterCard> {
  @override
  Widget build(BuildContext context) {
    final List<String> newLetterFamily = widget.letterFamily as List<String>;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            color: Colors.green[900]!.withOpacity(0.2),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [widget.primaryColor, widget.secondaryColor],
        ),
      ),
      height: 200.0,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () =>
              {AudioCache().play("audio/words/${widget.letterFamily}.mp3")},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => {
                          AudioCache().play(
                              "audio/letters/${widget.letterFamily[0]}.mp3")
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: FittedBox(
                                child: Text(
                                  widget.letterFamily[0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(
                                        fontSize: 70.0,
                                        letterSpacing: 4.0,
                                      ),
                                  softWrap: false,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                  'assets/images/icons/speaker_icon.png'),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            child: LetterCardItem(letter: newLetterFamily[0]),
                          ),
                          Expanded(
                            child: LetterCardItem(letter: newLetterFamily[1]),
                          ),
                          Expanded(
                            child: LetterCardItem(letter: newLetterFamily[2]),
                          ),
                          Expanded(
                            child: LetterCardItem(letter: newLetterFamily[3]),
                          ),
                          Expanded(
                            child: LetterCardItem(letter: newLetterFamily[4]),
                          ),
                          Expanded(
                            child: LetterCardItem(letter: newLetterFamily[5]),
                          ),
                          Expanded(
                            child: LetterCardItem(letter: newLetterFamily[6]),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
