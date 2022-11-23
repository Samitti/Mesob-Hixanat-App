import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spelling_bee/app/screens/colors_screen.dart';
import 'package:spelling_bee/app/screens/game_screen.dart';
import 'package:spelling_bee/app/screens/letters_screen.dart';
import 'package:spelling_bee/app/screens/shapes_screen.dart';
import 'package:spelling_bee/app/screens/videos_screen.dart';
import 'package:spelling_bee/app/screens/words_screen.dart';
import 'package:spelling_bee/app/widgets/category_card.dart';
import 'package:url_launcher/link.dart';

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
        cardIcon: 'video_icon.png',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.blueGrey,
        screen: VideosScreen(
          title: 'ቪድዮታት',
          primaryColor: Colors.redAccent[100]!,
          secondaryColor: Colors.blueGrey,
        ),
      ),
      Container(
        padding: EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 10,
              color: Colors.green[900]!.withOpacity(0.2),
            )
          ],
        ),
        child: Center(
          child: Link(
            target: LinkTarget.blank,
            uri: Uri.parse('https://bit.ly/3tryYDg'),
            builder: (context, followLink) => ElevatedButton(
              onPressed: () {
                int x = Random().nextInt(10);
                int y = Random().nextInt(10);
                int res = x * y;
                int result = x * y;

                int z = Random().nextInt(10) * Random().nextInt(10);
                int a = Random().nextInt(10) * Random().nextInt(30);
                List<int> gues = [a, res, z];
                gues = gues..shuffle();
                res = gues[0];
                z = gues[1];
                a = gues[2];
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'ቅኑዕ መልሲ ሃብ/ቢ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    content: Text(
                      '$x * $y = ___',
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: a == result
                            ? followLink
                            : () => Navigator.pop(context),
                        child: Text(
                          '$a',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: res == result
                            ? followLink
                            : () => Navigator.pop(context),
                        child: Text(
                          '$res',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: z == result
                            ? followLink
                            : () => Navigator.pop(context),
                        child: Text(
                          '$z',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'ነዚ ስራሕ ንምድጋፍ ንእትደልዩ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
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
