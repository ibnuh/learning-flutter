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
            title: Text('Inbox'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          drawer: Drawer(),
          body: _buildEmails(),
        ));
  }

  Widget _buildEmails() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.shade300,
            child: Text(
              "A",
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text("Amazon"),
          subtitle: Text("Your order is in process mate, please be patient."),
        ),
        Divider(),
      ],
    );
  }
}
