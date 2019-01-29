import 'package:flutter/material.dart';
import 'pages/landing_pg.dart';
import 'pages/signinPg.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData (
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      home: SignInPage(),
      routes: <String, WidgetBuilder>{
        '/SignInPg':(BuildContext context)=> new SignInPage(),
        '/LandPage': (BuildContext context)=> new LandPage()
      }
    );
  }
}
/*
class HomePage extends StatefulWidget {
  // Key Usage:A common case is if you need to differentiate between widgets by their keys,
  // ObjectKey and ValueKey can be useful for defining how the widgets are differentiated.


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


}*/


