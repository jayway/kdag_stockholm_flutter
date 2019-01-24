import 'package:flutter/material.dart';
import 'package:kdag_stockholm_flutter/countryModel.dart';
import 'package:kdag_stockholm_flutter/routeOneDetailed.dart';

class RouteOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RouteOnePage();
  }
}

class RouteOnePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteOneState();
  }
}

class RouteOneState extends State<RouteOnePage> {
  List<CountryModel> countryModels = List();

  @override
  void initState() {
    super.initState();
    countryModels.add(CountryModel('assets/flag_uk.png', 'UK'));
    countryModels.add(CountryModel('assets/flag_uk.png', 'GB'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Countries')),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return createListItemView(countryModels[index]);
            },
            itemCount: countryModels.length));
  }

  Widget createListItemView(CountryModel countryModel) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RouteOneDetailed(countryModel)));
        },
        child: Card(
            child: Container(
                margin:
                    EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 32),
                        child: Image(
                          height: 80,
                          width: 80,
                          image: AssetImage(countryModel.countryImgPath),
                        )),
                    Text(
                      countryModel.countryName,
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    )
                  ],
                ))));
  }
}
