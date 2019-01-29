import 'package:flutter/material.dart';


class LandPage extends StatefulWidget{
  @override
  _LandPageState createState()=> _LandPageState();
}

class _LandPageState extends State<LandPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Coeur'),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
              ),
              ListTile(
                title: Text('Item1'),
                onTap:(){},
              ),
              ListTile(
                title: Text('Item2'),
                onTap:(){},
              ),
              ListTile(
                title: Text('Item3'),
                onTap:(){},
              ),
              ListTile(
                title: Text('Item4'),
                onTap:(){},
              ),
            ],
          )
      ),
    );
  }
}