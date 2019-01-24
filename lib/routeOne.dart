import 'package:flutter/material.dart';

class RouteOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RouteOnePage();
  }

  Widget createListItemView(String countryImgPath, String countryName) {
    return Container(
        margin: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 32),
                child: Image(
                  height: 80,
                  width: 80,
                  image: AssetImage(countryImgPath),
                )),
            Text(
              countryName,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            )
          ],
        ));
  }
}

class RouteOnePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RouteOneState();
  }

}

class RouteOneState extends State<RouteOnePage>{
  List<CountryModel> countryModels = List();

  RouteOneState(){
    countryModels.add(CountryModel('assets/flag_uk.png', 'UK'));
    countryModels.add(CountryModel('assets/flag_uk.png', 'GB'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries')
      ),
    );
  }

}

class CountryModel{
  String _countryImgPath;
  String _countryName;

  CountryModel(this._countryImgPath, this._countryName);

  String get countryName => _countryName;

  String get countryImgPath => _countryImgPath;


}
