import 'package:emailapp/models/message.dart';
import 'package:flutter/material.dart';

class MessageCompositionScreen extends StatefulWidget {
  @override
  _MessageCompositionScreenState createState() =>
      _MessageCompositionScreenState();
}

class _MessageCompositionScreenState extends State<MessageCompositionScreen> {
  String to = "";
  String body = "";
  String subject = "";
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose new message'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    return !value.contains('@') ? "Must be an email" : null;
                  },
                  decoration: InputDecoration(
                    labelText: 'TO',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSaved: (value) => to = value,
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    int len = value.length;
                    if (len == 0) {
                      return "Cant be empty";
                    } else if (len < 4) {
                      return "Value must be longer than 4 characters";
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'SUBJECT',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSaved: (value) => subject = value,
                ),
              ),
              ListTile(
                title: TextFormField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: 'BODY',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSaved: (value) => body = value,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();
                      Message message = Message(subject, body);

                      Navigator.pop(context, message);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
