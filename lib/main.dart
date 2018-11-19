import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
// import './simple.dart';
// import './ui.dart';
// import './layout.dart';
import './elite.dart';
// import './login.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: RandomWords(),
      home: Scaffold(
        body: ElitePage(),
        // body: LoginPage()
      ),
      routes: {
        "/login": (context) => LoginPage()
      },
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _bigFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // final wordpair = WordPair.random();
    //   return Text(wordpair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('generator text'),
      ),
      body: _buildSuggestion(),
    );
  }

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: const EdgeInsets.all(18.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: _bigFont,
    ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}
