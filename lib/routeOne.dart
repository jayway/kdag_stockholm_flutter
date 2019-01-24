import 'package:flutter/material.dart';

class RouteOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createListItemView('assets/flag.png', 'UK'),
    );
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
