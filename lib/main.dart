import 'package:flutter/material.dart';
import 'package:kdag_stockholm_flutter/routeOne.dart';
import 'package:kdag_stockholm_flutter/routeTwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kdag Stockholm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        right: 32, left: 32, top: 120, bottom: 120),
                    child: Text(
                        "Hello you, how well do you know the flags with its abbreviations?",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 22, color: Colors.deepOrange))),
                ClipRRect(
                    borderRadius: new BorderRadius.circular(8.0),
                  child: RaisedButton(
                  color: Colors.lightGreenAccent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RouteOne()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 40, left: 40, top: 40, bottom: 40),
                      child: Text(
                        'Try your knowledge here',
                        style: TextStyle(fontSize: 22, color: Colors.pink),
                      ),
                    )),
                )
              ]),
        ));
  }
}
