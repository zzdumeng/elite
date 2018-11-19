
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';

class _ElitePageState extends State<ElitePage> {
  String _token;
  String _username;
  @override
  void initState() {
    super.initState();
    _getToken();
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.get('token') ?? '';
    _username = prefs.get('username') ?? '';
    if (_token == '') {
      // goto login page
      print('going to /login');
      Navigator.pushNamed(context, '/login');
    } else {
      setState(() {
        _token = _token;
        _username = _username;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return  Container(
        child: Text('home page'),
      );
      // Column(
      //   children: <Widget>[
      //     Center(child: Text("home page")
      //     )
      //   ],
      // );
  }
}

class ElitePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ElitePageState();
  }
}