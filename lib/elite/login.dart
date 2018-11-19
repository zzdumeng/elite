import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String _token = '';
  String _username = '';
  final nameController = TextEditingController();
  final pwController = TextEditingController();

  _loginSuccess() async {}

  Future<Null> _loginFail(String info) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login failed...'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(info),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK...'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  submit() async {
    String name = nameController.text.trim();
    String pw = pwController.text.trim();
    Map<String, String> body = {
      'question': 'app_login',
      'username': name,
      'password': pw,
      'rid': '191e35f7e0109cd52a9',
      'cime': 'AE572568-62C8-4495-915D-B693F4DA2C4A'
    };
    var dio = new Dio();

    var uri = 'https://i.jingyingba.com/app/app/index.php';
    Response<String> resp = await dio.post(uri,
        data: body,
        options: new Options(
            contentType:
                ContentType.parse("application/x-www-form-urlencoded")));
    var data = json.decode(resp.data);
    if (data['token']) {
      // success

      Navigator.pushNamed(context, '/');
    } else {
      _loginFail(data['info']);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[Text("Elite")],
        ),
        TextField(
          controller: nameController,
          decoration: InputDecoration(hintText: "username"),
        ),
        TextField(
          controller: pwController,
          obscureText: true,
          decoration: InputDecoration(hintText: "password"),
        ),
        FlatButton(
            onPressed: () {
              submit();
            },
            child: Text('login'))
      ],
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    pwController.dispose();

    super.dispose();
  }
}
