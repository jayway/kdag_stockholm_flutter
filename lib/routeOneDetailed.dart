import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kdag_stockholm_flutter/countryModel.dart';
import 'package:kdag_stockholm_flutter/post.dart';
import 'package:http/http.dart' as http;

class RouteOneDetailed extends StatelessWidget {
  final CountryModel countryModel;

  RouteOneDetailed(this.countryModel);

  @override
  Widget build(BuildContext context) {
    return RouteOneDetailedPage(countryModel);
  }
}

class RouteOneDetailedPage extends StatefulWidget {
  final CountryModel countryModel;

  RouteOneDetailedPage(this.countryModel);

  @override
  State<StatefulWidget> createState() {
    return RouteOneDetailedState(countryModel);
  }
}

class RouteOneDetailedState extends State<RouteOneDetailedPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  final CountryModel countryModel;

  RouteOneDetailedState(this.countryModel);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryModel.fullName),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          child: Column(
            children: <Widget>[
              Center(
                  child: AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget _widget) {
                  return new Transform.rotate(
                    angle: animationController.value * 6.3,
                    child: _widget,
                  );
                },
                child: Image(image: AssetImage(countryModel.countryImgPath)),
              )),
              FutureBuilder<Post>(
                future: fetchPost(countryModel),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.extract);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner
                  return CircularProgressIndicator();
                },
              )
            ],
          )),
    );
  }
}

Future<Post> fetchPost(CountryModel countryModel) async {
  final response = await http.get(
      'https://en.wikipedia.org/api/rest_v1/page/summary/${countryModel.fullName}');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
