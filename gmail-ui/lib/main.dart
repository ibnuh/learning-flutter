import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'dart:math';

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
          body: RandomEmail(),
        ));
  }
}

class Email {
  String sender;
  String excerpt;
}

class RandomEmailsState extends State<RandomEmail> {
  final List<Email> _emails = List<Email>();

  List<Widget> _generateRandomEmails() {
    for (var i = 0; i < 10; i++) {
      var email = new Email();

      email.sender = faker.person.name();
      email.excerpt = faker.lorem.sentence();

      _emails.add(email);
    }

    return _emails
        .map((e) => Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Text(
                      e.sender[0],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      e.sender,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  subtitle: Text(e.excerpt),
                ),
                Divider()
              ],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _generateRandomEmails(),
    );
  }
}

class RandomEmail extends StatefulWidget {
  @override
  RandomEmailsState createState() => RandomEmailsState();
}
