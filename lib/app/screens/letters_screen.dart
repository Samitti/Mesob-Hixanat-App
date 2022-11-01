import 'package:flutter/material.dart';
import 'package:spelling_bee/app/controllers/color_controller.dart';
import 'package:spelling_bee/app/widgets/page_header.dart';
import 'package:spelling_bee/app/widgets/tile_card.dart';

class LettersScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  LettersScreen({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
                  child: TileCard(
                    title: colorList[index].name,
                    textColor: colorList[index].name == 'ጻዕዳ'
                        ? const Color(0xFF303030)
                        : Colors.white,
                    backgroundColor: Color(int.parse(colorList[index].code)),
                    fontSizeBase: 30,
                    fontSizeActive: 40,
                    onTap: () {
                      // _playAudio(colorList[index].audio),
                    },
                  ),
                );
              },
              childCount: colorList.length,
            ),
          ),
        ],
      ),
    );
  }
}
