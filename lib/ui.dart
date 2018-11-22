library ui;

import 'package:flutter/material.dart';

class PlayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child:
            //  Container(
            //   width: 120.0,
            //   height: 120.0,
            //   margin: const EdgeInsets.all(10.0),
            //   color: const Color(0xff00ff00),
            // ),
            Container(
                constraints: BoxConstraints.expand(
                    // height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
                    ),
                padding: const EdgeInsets.all(8.0),
                color: Colors.teal.shade700,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Placeholder(fallbackHeight: 320.0,)
                      ,FlutterLogo()
                    ],),
                    // buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton.icon(
                          icon: Icon(Icons.dashboard),
                          label: Text("raised"),
                          onPressed: () => Scaffold.of(context).showBottomSheet(
                            (context) => Text("bottomsheet")
                          ) ,
                        ),
                        FlatButton(
                          child: Text("flat"),
                          onPressed: () => 
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('oh cake cake'),
                            ))
                          ,
                        ),
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text("item1"),
                            ),
                            DropdownMenuItem(
                              child: Text("item2"),
                            )
                          ],
                          onChanged: (item) => {},
                        )
                      ],
                    ),
                    // icons
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.call),
                          Icon(Icons.ac_unit),
                          Icon(Icons.backspace),
                          Icon(Icons.cake),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.red,
                        )),
                        Expanded(
                          child: Container(
                            height: 80.0,
                            child: Image.asset(
                              "images/lake.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("item1"),
                        Container(
                          width: 100.0,
                          height: 100.0,
                          color: Colors.lime.shade100,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          color: Colors.red,
                          child: Text("third item"),
                        )
                      ],
                    )
                  ],
                )
                //  Text('Hello World',
                //     style: Theme.of(context)
                //         .textTheme
                //         .display1
                //         .copyWith(color: Colors.white)),
                // foregroundDecoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: NetworkImage('https://www.example.com/images/frame.png'),
                //     centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                //   ),
                // ),
                // transform: Matrix4.
                // Matrix4.rotationZ(0.1),
                ));
  }
}

class ImageView extends StatelessWidget {
  Column buildButtonColumn(BuildContext ctx, IconData icon, String label) {
    Color color = Theme.of(ctx).primaryColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(context, Icons.call, 'CALL'),
          buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Oeschinen Lake',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('Kandersteg', style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          Text('41'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return ListView(
      children: <Widget>[
        Image.asset(
          'images/lake.jpg',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection
      ],
    );
  }
}
