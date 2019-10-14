import 'package:emailapp/widgets/app_drawer.dart';
import 'package:emailapp/widgets/compose_button.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final String title = 'Messages';

  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          floatingActionButton: ComposeButton(),
          drawer: AppDrawer(),
        );
     
      
    
  }
}
