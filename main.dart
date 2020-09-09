import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Weird Calculator"),
        ),
        body: Center(
            child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(child: Text("Modulo"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ModuloPage()),);}),
                      RaisedButton(child: Text("Digital Root"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DigitalRootPage()),);}),
                      RaisedButton(child: Text("Lunar Addition"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LunarAdditionPage()),);}),
                    ]
                  ), Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(child: Text("Base Conversion"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => BaseConversionsPage()),);}),
                        RaisedButton(child: Text("Legendre Symbol"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LegendreSymbolPage()),);}),
                      ]
                  )
                ]
              )
        )
    );
  }
}

class ModuloPage extends StatefulWidget {
  ModuloPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ModuloPageState createState() => _ModuloPageState();
}

class _ModuloPageState extends State<ModuloPage> {
  TextEditingController numberC;
  TextEditingController modC;
  TextEditingController answerC;

  //void initState() {super.initState(); _resetController();}

  //void _resetController() {numberC = TextEditingController(text: '0');modC = TextEditingController(text: '0');answerC = TextEditingController(text: '0');}

  //void dispose() {numberC.dispose(); modC.dispose(); answerC.dispose(); super.dispose();}

  String calculate(String n, String m){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modulo"),
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: numberC, keyboardType: TextInputType.number),
            Text("mod"),
            TextField(controller: modC, keyboardType: TextInputType.number),
            RaisedButton(child: Text("="), onPressed: () {answerC = TextEditingController(text: calculate(numberC.text.toString(), modC.text.toString()));}),
          ],
        ),
      ),
    );
  }


}

class DigitalRootPage extends StatefulWidget {

  DigitalRootPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DigitalRootPageState createState() => _DigitalRootPageState();
}

class _DigitalRootPageState extends State<DigitalRootPage> {
  TextEditingController numberC;
  TextEditingController answerC;

  String calculate(String n){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Root"),
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: numberC, keyboardType: TextInputType.number),
            RaisedButton(child: Text("="), onPressed: () {answerC = TextEditingController(text: calculate(numberC.text.toString()));}),
          ],
        ),
      ),
    );
  }
}

class LunarAdditionPage extends StatefulWidget {

  LunarAdditionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LunarAdditionPageState createState() => _LunarAdditionPageState();
}

class _LunarAdditionPageState extends State<LunarAdditionPage> {
  TextEditingController fstNumberC;
  TextEditingController sndNumberC;
  TextEditingController answerC;

  String calculate(String n, String m){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modulo"),
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: fstNumberC, keyboardType: TextInputType.number),
            Text("+"),
            TextField(controller: sndNumberC, keyboardType: TextInputType.number),
            RaisedButton(child: Text("="), onPressed: () {answerC = TextEditingController(text: calculate(fstNumberC.text.toString(), sndNumberC.text.toString()));}),
          ],
        ),
      ),
    );
  }


}

class BaseConversionsPage extends StatefulWidget {

  BaseConversionsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BaseConversionsPageState createState() => _BaseConversionsPageState();
}

class _BaseConversionsPageState extends State<BaseConversionsPage> {
  TextEditingController numberC;
  TextEditingController baseC;
  TextEditingController answerC;

  String calculate(String n, String m){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Base Conversion"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: numberC, keyboardType: TextInputType.number),
            Text("base"),
            TextField(controller: baseC, keyboardType: TextInputType.number),
            RaisedButton(child: Text("="), onPressed: () {
              answerC = TextEditingController(text: calculate(
                  numberC.text.toString(), baseC.text.toString()));
            }),
          ],
        ),
      ),
    );
  }
}

class LegendreSymbolPage extends StatefulWidget {

  LegendreSymbolPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LegendreSymbolPageState createState() => _LegendreSymbolPageState();
}

class _LegendreSymbolPageState extends State<LegendreSymbolPage> {
  TextEditingController numberC;
  TextEditingController primeC;
  TextEditingController answerC;

  //void initState() {super.initState(); _resetController();}

  //void _resetController() {numberC = TextEditingController(text: '0');modC = TextEditingController(text: '0');answerC = TextEditingController(text: '0');}

  //void dispose() {numberC.dispose(); modC.dispose(); answerC.dispose(); super.dispose();}

  String calculate(String n, String m){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Legendre Symbol"),
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: numberC, keyboardType: TextInputType.number),
            Text("."),
            TextField(controller: primeC, keyboardType: TextInputType.number),
            RaisedButton(child: Text("="), onPressed: () {answerC = TextEditingController(text: calculate(numberC.text.toString(), primeC.text.toString()));}),
          ],
        ),
      ),
    );
  }
}

