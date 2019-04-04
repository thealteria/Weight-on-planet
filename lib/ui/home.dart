import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formatedText = "";

  final TextEditingController _weightController = new TextEditingController();
  void handledRadioValue(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formatedText =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formatedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formatedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your weight on Earth',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  // three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 0,
                        activeColor: Colors.brown,
                        groupValue: radioValue,
                        onChanged: handledRadioValue,
                      ),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                        value: 1,
                        activeColor: Colors.red,
                        groupValue: radioValue,
                        onChanged: handledRadioValue,
                      ),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                        value: 2,
                        activeColor: Colors.orangeAccent,
                        groupValue: radioValue,
                        onChanged: handledRadioValue,
                      ),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  //result text
                  new Padding(
                    padding: new EdgeInsets.all(5.6),
                  ),
                  new Text(
                    _weightController.text.isEmpty
                        ? "Please enter weight"
                        : "$_formatedText lbs",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong");
      return int.parse("180") * 0.38;
    }
  }
}
