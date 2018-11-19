library simple;
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class SimpleState extends State<Simple> {
  String _text = 'loading';
  void t(tar) {
    setState(() {
      _text = tar;
    });
  }

  request() async {
    var u = 'https://untitled-sz15wlm8fdn3.runkit.sh/';
    var url = Uri.parse(u);
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    var data = await response.transform(utf8.decoder).toList();
    print('Response ${response.statusCode}: $data');
    httpClient.close();
    t(data[0]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('get the dart http'),
        ),
        body: Row(
          children: [
            Text(_text),
            IconButton(
              icon: Icon(Icons.star),
              color: Colors.red[500],
              onPressed: request,
            ),
          ],
        ));
  }
}

class Simple extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SimpleState();
  }
}
