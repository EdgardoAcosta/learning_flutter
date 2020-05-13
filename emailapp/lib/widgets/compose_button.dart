import 'package:emailapp/models/message.dart';
import 'package:emailapp/screens/message_composition_screen.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MessageCompositionScreen()));

        if (message != null)
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Youre message was save '),
            backgroundColor: Colors.blueAccent,
          ));
      },
    );
  }
}
