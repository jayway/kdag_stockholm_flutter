import 'package:flutter/material.dart';
import 'package:kdag_stockholm_flutter/countryModel.dart';

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
      body: Center(
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
    );
  }
}
