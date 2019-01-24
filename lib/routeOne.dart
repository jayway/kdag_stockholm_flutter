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
    countryModels.add(CountryModel('assets/flag_brazil.png', 'BR', "Brazil"));
    countryModels.add(CountryModel('assets/flag_canada.png', 'CA', "Canada"));
    countryModels.add(CountryModel("assets/flag_denmark.png", "DK", "Denmark"));
    countryModels.add(CountryModel('assets/flag_mozambique.png', 'MZ', "Mozambique"));
    countryModels.add(CountryModel('assets/flag_nepal.png', 'NP', "Nepal"));
    countryModels.add(CountryModel("assets/flag_south_africa.png", "SA", "South Africa"));
    countryModels.add(CountryModel("assets/flag_sweden.png", "SE", "Sweden"));
    countryModels.add(CountryModel('assets/flag_uganda.png', 'UG', "Uganda"));
    countryModels.add(CountryModel('assets/flag_uk.png', 'UK', "United Kingdom"));
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
