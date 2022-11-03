import 'package:flutter/material.dart';
import 'package:spelling_bee/app/widgets/page_header.dart';

import '../controllers/all_letters.dart';
import '../widgets/letter_card.dart';

class LettersScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const LettersScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<LettersScreen> createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  double offset = 0;

  get allWords => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: PageHeader(
              title: widget.title,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: LetterCard(
                        letterFamily: allLetters[index].toList(),
                        primaryColor: Colors.orangeAccent[100]!,
                        secondaryColor: widget.secondaryColor,
                      )),
                );
              },
              childCount: allLetters.length, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
