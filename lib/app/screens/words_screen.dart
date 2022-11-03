import 'package:flutter/material.dart';
import 'package:spelling_bee/app/controllers/all_words.dart';
import 'package:spelling_bee/app/widgets/page_header.dart';

import '../widgets/word_card.dart';

class WordsScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const WordsScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<WordsScreen> createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  double offset = 0;

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
                      height: 180,
                      alignment: Alignment.center,
                      child: WordCard(
                        title: allWords[index],
                        primaryColor: Colors.orangeAccent[100]!,
                        secondaryColor: widget.secondaryColor,
                      )),
                );
              },
              childCount: allWords.length, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
