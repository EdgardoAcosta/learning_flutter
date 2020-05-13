import 'package:emailapp/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import '../message_list.dart';

class InoboxScreen extends StatefulWidget {
  @override
  _InoboxScreenState createState() => _InoboxScreenState();
}

class _InoboxScreenState extends State<InoboxScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
//                var _messages = Message.browse();
//
              },
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Important",
              ),
              Tab(
                text: "Other",
              )
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            MessageList(),
            MessageList(status: 'other'),
          ],
        ),
      ),
      length: 2,
    );
  }
}
