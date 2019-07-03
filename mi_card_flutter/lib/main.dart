import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/user.png'),
              ),
              Text(
                'Edgardo Acosta',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontSize: 40.5,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Developer',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.white,
                    fontSize: 20.5,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '+ 52 81 8092 5698',
                      style: TextStyle(
                          color: Colors.teal.shade900, fontSize: 20.5),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
