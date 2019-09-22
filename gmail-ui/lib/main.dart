import 'package:flutter/material.dart';

void main() => runApp(GmailApp());

class GmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gmail',
        theme: ThemeData(primaryColor: Colors.red),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Primary'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          drawer: Drawer(),
          body: Container(
            child: Center(
              child: Text('How ya doin'),
            ),
          ),
        ));
  }
}
