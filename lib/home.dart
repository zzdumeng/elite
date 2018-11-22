import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './elite.dart';
import './tabs/tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  String _token;
  String _username;
  getTabbarView(var tabs) {
    return TabBarView(children: tabs, controller: tabController);
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.get('token') ?? '';
    _username = prefs.get('username') ?? '';
    if (_token == '') {
      // goto login page
      print('token is empty, going to /login');
      Navigator.pushNamed(context, '/login');
    } else {
      setState(() {
        _token = _token;
        _username = _username;
        print("token is $_token, usrname is $_username");
      });
    }
  }

  /**
   * fake scan code to DAKAI
   */
  scanCode() {
    presentDialog(({'title': "success", 'info': "has dakai"}));
  }
  presentDialog(var data) async {
    showDialog(context: context,barrierDismissible: false, builder: (context) {
      return AlertDialog(
        title: Text(data["title"]),
        content: Text(data["info"]),
        actions: <Widget>[
          FlatButton.icon(label: Text("got it"), icon: Icon(Icons.crop_square),
          onPressed: (){
            Navigator.of(context).pop();
          },
          )],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    _getToken();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("swanlake"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "record", icon: Icon(Icons.account_circle)),
            Tab(text: "me", icon: Icon(Icons.memory))
          ],
          controller: tabController,
        ),
      ),
      // body: getTabbarView([Tab1(), Tab2()])
      body: getTabbarView([ElitePage(), MePage()]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.center_focus_strong),
        onPressed: scanCode,
      ),
    );
  }
}
