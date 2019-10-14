import 'package:flutter/material.dart';

class MessageDetailScreen extends StatelessWidget {
  final String subject;
  final String body;

  const MessageDetailScreen({@required this.subject, @required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.subject),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(this.body),
      ),
    );
  }
}
