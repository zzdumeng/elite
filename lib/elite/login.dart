import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  // FIXME: remove my psw
  String _token = '13681647716';
  String _username = 'jingyingjia';
  final nameController = TextEditingController();
  final pwController = TextEditingController();

  initState() {
    super.initState();
    nameController.text = _username;
    pwController.text = _token;
  }
  _loginSuccess(var data) async {
      print("success, token is $data['token']");
      // save to preference
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("token", data['token']);
      await pref.setString("username", data['name']);
      Navigator.pushNamed(context, '/');
  }

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
  Future<String> get _cookieFile async{
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path + "/.cookies";
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
    dio.cookieJar = new PersistCookieJar(await _cookieFile);
    var uri = 'https://i.jingyingba.com/app/app/index.php';
    Response<String> resp = await dio.post(uri,
        data: body,
        options: new Options(
            contentType:
                ContentType.parse("application/x-www-form-urlencoded")));
    var data = json.decode(resp.data);
    if (data['token']) {
      // success
      print(resp.headers.value(HttpHeaders.setCookieHeader));
      _loginSuccess(data);
    } else {
      _loginFail(data['info']);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Column(
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
    )));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    pwController.dispose();

    super.dispose();
  }
}
