import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../controllers/color_controller.dart';
import '../controllers/numbers_controller.dart';
import '../widgets/numbers_tile_card.dart';
import '../widgets/page_header.dart';
import '../widgets/tile_card.dart';

class NumbersScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const NumbersScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
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
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: NumbersTileCard(
                    title: numbersList[index].name,
                    textColor: numbersList[index].code == '0xccffffff'
                        ? const Color(0xFF303030)
                        : Colors.white,
                    backgroundColor: Color(int.parse(numbersList[index].code)),
                    fontSizeBase: 50,
                    fontSizeActive: 40,
                    onTap: () {
                      AudioCache()
                          .play("audio/numbers/${numbersList[index].name}.mp3");
                    },
                  ),
                );
              },
              childCount: numbersList.length,
            ),
          ),
        ],
      ),
    );
  }
}
