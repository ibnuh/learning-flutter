import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Word Generator',
      theme: ThemeData(primaryColor: Colors.white),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildRow(WordPair pair) {
    final bool isSaved = _saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: Icon(isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }

          print(isSaved);
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        // TODO:: Figure out why the UI didn't refresh after a state change on different route
        // _buildRow() onTap event doesn't work as intended.
        final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
          return _buildRow(pair);
        });

        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

        return Scaffold(
            appBar: AppBar(
              title: Text('Saved words'),
            ),
            body: ListView(children: divided));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Word Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
