library ui;

import 'package:flutter/material.dart';

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
