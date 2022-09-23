import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_bee/controller.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.amber,
      title: Text(
        'Well Done',
        style: Theme.of(context).textTheme.headline1,
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
            Provider.of<Controller>(context, listen: false)
                .requestWord(request: true);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New Word',
              style:
                  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30),
            ),
          ),
        )
      ],
    );
  }
}
