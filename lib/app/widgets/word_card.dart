import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class WordCard extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const WordCard({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
      height: 180.0,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => {AudioCache().play("audio/words/${widget.title}.mp3")},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          widget.title,
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    fontSize: 70.0,
                                    letterSpacing: 4.0,
                                  ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/game/${widget.title}.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
