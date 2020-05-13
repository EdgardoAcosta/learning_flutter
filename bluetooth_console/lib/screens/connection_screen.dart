import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConnectionScreen extends StatefulWidget {
  static const String id = 'connection_screen';

  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  //https://pub.dev/packages/flutter_blue#-readme-tab-
  FlutterBlue flutterBlue = FlutterBlue.instance;
  var scanSubscription;
  var device;

  void scan() {
    try {
      /// Start scanning
      scanSubscription = flutterBlue.scan().listen((scanResult) {
        device = scanResult.device;
        print('${device.name} found! rssi: ${scanResult.rssi}');
      });
    } catch (e) {
      print('ERROR: $e');
    }
  }

  void stopScan() {
    if (scanSubscription != null) scanSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('Bluetooth Console'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                scan();
              },
              child: Text(
                'Scan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlue,
            ),
            RaisedButton(
              onPressed: () {
                stopScan();
              },
              child: Text(
                'Cancel Scan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
