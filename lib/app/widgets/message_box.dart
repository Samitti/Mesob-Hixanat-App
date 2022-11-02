import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_bee/app/screens/game_screen.dart';
import '../controllers/controller.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    required this.sessionCompleted,
    Key? key,
  }) : super(key: key);

  final bool sessionCompleted;

  @override
  Widget build(BuildContext context) {
    String title = "ጽቡቕ !";
    String buttonText = "ሓድሽ ቃል";
    if (sessionCompleted) {
      title = "ኩለን ቃላት ተሰሪሐን";
      buttonText = "እንደገና ንጻወት";
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      backgroundColor: Color.fromARGB(255, 129, 83, 247),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 40),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            if (sessionCompleted) {
              Provider.of<Controller>(context, listen: false).reset();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => GameScreen(
                        title: 'ጸወታ',
                        primaryColor: Colors.orangeAccent[100]!,
                        secondaryColor: const Color.fromARGB(255, 79, 42, 198),
                      )));
            } else {
              Provider.of<Controller>(context, listen: false)
                  .requestWord(request: true);
              Navigator.of(context).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style:
                  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30),
            ),
          ),
        )
      ],
    );
  }
}
