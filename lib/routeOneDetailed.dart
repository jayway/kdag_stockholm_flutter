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

class RouteOneDetailedState extends State<RouteOneDetailedPage> {
  final CountryModel countryModel;

  RouteOneDetailedState(this.countryModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryModel.countryName),
      ),
      body: Center(
        child: Image(image: AssetImage(countryModel.countryImgPath)),
      ),
    );
  }
}
