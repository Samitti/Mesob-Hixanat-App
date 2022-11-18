import 'package:flutter/material.dart';
import 'package:spelling_bee/app/screens/colors_screen.dart';
import 'package:spelling_bee/app/screens/game_screen.dart';
import 'package:spelling_bee/app/screens/letters_screen.dart';
import 'package:spelling_bee/app/screens/shapes_screen.dart';
import 'package:spelling_bee/app/screens/videos_screen.dart';
import 'package:spelling_bee/app/screens/words_screen.dart';
import 'package:spelling_bee/app/widgets/category_card.dart';

import 'numbers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      CategoryCard(
        title: 'ግድላት',
        cardIcon: 'game.png',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: const Color.fromARGB(255, 79, 42, 198),
        screen: GameScreen(
          title: 'ጸወታ',
          primaryColor: Colors.orangeAccent[100]!,
          secondaryColor: const Color.fromARGB(255, 79, 42, 198),
        ),
      ),
      CategoryCard(
        title: 'በሰሸ',
        cardIcon: 'letters.png',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.green,
        screen: LettersScreen(
          title: 'በሰሸ',
          primaryColor: Colors.greenAccent[100]!,
          secondaryColor: Colors.green,
        ),
      ),
      CategoryCard(
        title: 'ቃላት',
        cardIcon: 'words.png',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.purple,
        screen: WordsScreen(
          title: 'ቃላት',
          primaryColor: Colors.purpleAccent[100]!,
          secondaryColor: Colors.purple,
        ),
      ),
      const CategoryCard(
        title: '123',
        cardIcon: 'numbers.png',
        primaryColor: Color.fromARGB(255, 200, 255, 128),
        secondaryColor: Color.fromARGB(255, 255, 204, 1),
        screen: NumbersScreen(
          title: '123',
          primaryColor: Color(0xFF3383CD),
          secondaryColor: Color.fromARGB(255, 255, 204, 1),
        ),
      ),
      CategoryCard(
        title: 'ቅርጽታት',
        cardIcon: 'shapes.png',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.red,
        screen: ShapesScreen(
          title: 'ቅርጽታት',
          primaryColor: Colors.redAccent[100]!,
          secondaryColor: Colors.red,
        ),
      ),
      CategoryCard(
        title: 'ሕብርታት',
        cardIcon: 'colors.png',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: const Color.fromARGB(255, 223, 30, 233),
        screen: ColorsScreen(
          title: 'ሕብርታት',
          primaryColor: Colors.redAccent[100]!,
          secondaryColor: const Color.fromARGB(255, 223, 30, 233),
        ),
      ),
      CategoryCard(
        title: 'ቪድዮታት',
        cardIcon: 'stories.png',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.blueGrey,
        screen: VideosScreen(
          title: 'ቪድዮታት',
          primaryColor: Colors.redAccent[100]!,
          secondaryColor: Colors.blueGrey,
        ),
      )
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          image: const DecorationImage(
            image: AssetImage('assets/images/bg-bottom.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 188.0,
              backgroundColor: Colors.green[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/bg-top-1xx.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(categories),
            )
          ],
        ),
      ),
    );
  }
}
