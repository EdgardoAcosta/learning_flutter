
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("Email@email.com"),
            accountName: Text("User name"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars1.githubusercontent.com/u/11066125?s=460&v=4"),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Add new account..."),
                        );
                      });
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text("Inbox"),
            trailing: Chip(
              label: Text(
                "11",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text("Draft"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane),
            title: Text("Sent"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text("Trash"),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.cog),
                title: Text("Settings"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
