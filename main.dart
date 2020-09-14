import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // learned how to use Google fonts from https://pub.dev/packages/google_fonts

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

  TextStyle tsHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 30,
  );
  TextStyle tsSubHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 25,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Weird Calculator", style: tsHeading),
          backgroundColor: Colors.black,
        ),
        body: Center(
            child:
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text("Modulo", style: tsSubHeading), color: Colors.redAccent, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ModuloPage()),);}),
                  ),

                  SizedBox(height: 30),

                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text("Digital Root", style: tsSubHeading), color: Colors.orangeAccent, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DigitalRootPage()),);}),
                  ),

                  SizedBox(height: 30),

                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text("Lunar Addition", style: tsSubHeading), color: Colors.greenAccent, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LunarAdditionPage()),);}),
                  ),

                  SizedBox(height: 30),

                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text("Base Conversions", style: tsSubHeading), color: Colors.blueAccent, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BaseConversionsPage()),);}),
                  ),

                  SizedBox(height: 30),

                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text("Legendre Symbol", style: tsSubHeading), color: Colors.deepPurpleAccent, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LegendreSymbolPage()),);}),
                  ),
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
  TextEditingController numberC = new TextEditingController();
  TextEditingController modC = new TextEditingController();
  String answerString = "";
  TextStyle tsHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 30,
  );
  TextStyle tsBody = GoogleFonts.roboto(
    textStyle: TextStyle(letterSpacing: 1),
    fontSize: 17,
  );

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
        title: Text("Modulo", style: tsHeading),
          backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 80, child: TextField(controller: numberC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Text("mod", style: tsBody),
            SizedBox(width: 10),
            SizedBox(width: 80, child: TextField(controller: modC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                answerString = calculate(numberC.text.toString(), modC.text.toString());
              });},
              padding: EdgeInsets.only(left: 5, right: 5)),
            ),
            SizedBox(width: 10),
            Container(
              width: 50,
              child: Text('$answerString', style: tsBody),
            ),
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
  TextEditingController numberC = new TextEditingController();
  String answerString = "";
  TextStyle tsHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 30,
  );
  TextStyle tsBody = GoogleFonts.roboto(
    textStyle: TextStyle(letterSpacing: 1),
    fontSize: 17,
  );

  String calculate(String n){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Root", style: tsHeading),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 100, child: TextField(controller: numberC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                answerString = calculate(numberC.text.toString());
              });},
                  padding: EdgeInsets.only(left: 5, right: 5)),
            ),
            SizedBox(width: 10),
            Container(
              width: 100,
              child: Text('$answerString', style: tsBody),
            ),
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
  TextEditingController fstNumberC = new TextEditingController();
  TextEditingController sndNumberC = new TextEditingController();
  String answerString = "";
  TextStyle tsHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 30,
  );
  TextStyle tsBody = GoogleFonts.roboto(
    textStyle: TextStyle(letterSpacing: 1),
    fontSize: 17,
  );

  String calculate(String n, String m){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lunar Addition", style: tsHeading),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 80, child: TextField(controller: fstNumberC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Text("+", style: tsBody),
            SizedBox(width: 10),
            SizedBox(width: 80, child: TextField(controller: sndNumberC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                answerString = calculate(fstNumberC.text.toString(), sndNumberC.text.toString());
              });},
                  padding: EdgeInsets.only(left: 5, right: 5)),
            ),
            SizedBox(width: 10),
            Container(
              width: 50,
              child: Text('$answerString', style: tsBody),
            ),
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
  TextEditingController numberC = new TextEditingController();
  TextEditingController baseC = new TextEditingController();
  String answerString = "";
  TextStyle tsHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 30,
  );
  TextStyle tsBody = GoogleFonts.roboto(
    textStyle: TextStyle(letterSpacing: 1),
    fontSize: 17,
  );

  String calculate(String n, String m){
    return n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Base Conversion", style: tsHeading),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 80, child: TextField(controller: numberC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Text("base", style: tsBody),
            SizedBox(width: 10),
            SizedBox(width: 80, child: TextField(controller: baseC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                answerString = calculate(numberC.text.toString(), baseC.text.toString());
              });},
                  padding: EdgeInsets.only(left: 5, right: 5)),
            ),
            SizedBox(width: 10),
            Container(
              width: 50,
              child: Text('$answerString', style: tsBody),
            ),
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
  TextEditingController numberC = new TextEditingController();
  TextEditingController primeC = new TextEditingController();
  String answerString = "";
  TextStyle tsHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 30,
  );
  TextStyle tsBody = GoogleFonts.roboto(
    textStyle: TextStyle(letterSpacing: 1),
    fontSize: 17,
  );

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
        title: Text("Legendre Symbol", style: tsHeading),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 80, child: TextField(controller: numberC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Text(".", style: tsBody),
            SizedBox(width: 10),
            SizedBox(width: 80, child: TextField(controller: primeC, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                answerString = calculate(numberC.text.toString(), primeC.text.toString());
              });},
                  padding: EdgeInsets.only(left: 5, right: 5)),
            ),
            SizedBox(width: 10),
            Container(
              width: 50,
              child: Text('$answerString', style: tsBody),
            ),
          ],
        ),
      ),
    );
  }
}
