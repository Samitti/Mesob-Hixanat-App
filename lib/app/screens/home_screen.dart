import 'package:flutter/material.dart';
import 'package:spelling_bee/app/screens/letters_screen.dart';
import 'package:spelling_bee/app/screens/word_game.dart';
import 'package:spelling_bee/app/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      CategoryCard(
        title: 'ጸወታ',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.orange,
        screen: WordGame(
            // title: 'ጸወታ',
            // primaryColor: Colors.orangeAccent[100]!,
            // secondaryColor: Colors.orange,
            ),
      ),
      CategoryCard(
        title: 'በሰሸ',
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
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.purple,
        screen: LettersScreen(
          title: 'ቃላት',
          primaryColor: Colors.purpleAccent[100]!,
          secondaryColor: Colors.purple,
        ),
      ),
      CategoryCard(
        title: '123',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Color(0xFF11249F),
        screen: LettersScreen(
          title: '123',
          primaryColor: Color(0xFF3383CD),
          secondaryColor: Color(0xFF11249F),
        ),
      ),
      CategoryCard(
        title: 'ቅርጽታት',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.red,
        screen: LettersScreen(
          title: 'ቅርጽታት',
          primaryColor: Colors.redAccent[100]!,
          secondaryColor: Colors.red,
        ),
      ),
      CategoryCard(
        title: 'ሕብርታት',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Color.fromARGB(255, 223, 30, 233),
        screen: LettersScreen(
          title: 'ሕብርታት',
          primaryColor: Colors.redAccent[100]!,
          secondaryColor: Color.fromARGB(255, 223, 30, 233),
        ),
      ),
      CategoryCard(
        title: 'ዛንታታት',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.blueGrey,
        screen: LettersScreen(
          title: 'ዛንታታት',
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
                  'assets/images/bg-top.png',
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
