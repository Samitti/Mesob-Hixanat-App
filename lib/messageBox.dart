import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './homePage.dart';
import '/controller.dart';

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
      backgroundColor: Colors.amber,
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
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
              AudioCache().play("audio/win.mp3");
              Provider.of<Controller>(context, listen: false).reset();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
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
