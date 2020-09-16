import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';// learned how to use Google fonts from https://pub.dev/packages/google_fonts
import 'package:weird_calculator/calculator.dart';

import 'calculator.dart';

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
                    child:RaisedButton(child: Text(name[Operation.Modulo], style: tsSubHeading), color: colors[Operation.Modulo], onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorPage(title: name[Operation.Modulo], op: Operation.Modulo)),);}),
                  ),
                  SizedBox(height:20),
                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text(name[Operation.DigitalRoot], style: tsSubHeading), color: colors[Operation.DigitalRoot], onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorPage(title: name[Operation.DigitalRoot], op: Operation.DigitalRoot)),);}),
                  ),
                  SizedBox(height:20),
                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text(name[Operation.LunarAddition], style: tsSubHeading), color: colors[Operation.LunarAddition], onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorPage(title: name[Operation.LunarAddition], op: Operation.LunarAddition)),);}),
                  ),
                  SizedBox(height:20),
                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text(name[Operation.BaseConversion], style: tsSubHeading), color: colors[Operation.BaseConversion], onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorPage(title: name[Operation.BaseConversion], op: Operation.BaseConversion)),);}),
                  ),
                  SizedBox(height:20),
                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text(name[Operation.LegendreSymbol], style: tsSubHeading), color: colors[Operation.LegendreSymbol], onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorPage(title: name[Operation.LegendreSymbol], op: Operation.LegendreSymbol)),);}),
                  ),
                ]
              )
        )
    );
  }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title, this.op}) : super(key: key);

  final String title;

  final Operation op;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController one = new TextEditingController();
  TextEditingController two = new TextEditingController();
  String answerString = "";
  TextStyle tsHeading = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 1),
    fontSize: 30,
  );
  TextStyle tsBody = GoogleFonts.roboto(
    textStyle: TextStyle(letterSpacing: 1),
    fontSize: 17,
  );
  int fromBase = 1;
  int toBase = 1;

  @override
  Widget build(BuildContext context) {
    Operation op = widget.op;
    if (op == Operation.DigitalRoot){
      return digitalRootScaffold(context);
    } else if (op == Operation.BaseConversion) {
      return baseConversionScaffold(context);
    } else if (op == Operation.LegendreSymbol) {
      return legendreSymbolScaffold(context);
    }
    return twoInputScaffold(context);
  }

  Widget twoInputScaffold(BuildContext context) {
    Operation op = widget.op; // learned how to pass variables between classes at https://stackoverflow.com/questions/50818770/passing-data-to-a-stateful-widget
    return Scaffold(
      appBar: AppBar(
        title: Text(name[op], style: tsHeading),
        backgroundColor: colors[op],
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 80, child: TextField(controller: one, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Text(opSymbol[op], style: tsBody),
            SizedBox(width: 10),
            SizedBox(width: 80, child: TextField(controller: two, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                int n = int.tryParse(one.text.toString());
                int m = int.tryParse(two.text.toString());
                if (n!=null && m!=null) {
                  if (op == Operation.LunarAddition){
                    if ((n>=0) && (m>=0)){
                      answerString = lunarAddition(n,m).toString();
                    } else {
                      answerString = "invalid input";
                    }
                  } else {
                    if (m>0) {
                      answerString = operations[op](n,m).toString();
                    } else {
                      answerString = "invalid input";
                    }
                  }
                }
                else{
                  answerString = "invalid input";
                }
              });},
                  padding: EdgeInsets.only(left: 5, right: 5)),
            ),
            SizedBox(width: 10),
            Container(
              width: 80,
              child: Text('$answerString', style: tsBody),
            ),
          ],
        ),
      ),
    );
  }

  Widget legendreSymbolScaffold(BuildContext context) {
    Operation op = widget.op; // learned how to pass variables between classes at https://stackoverflow.com/questions/50818770/passing-data-to-a-stateful-widget
    return Scaffold(
      appBar: AppBar(
        title: Text(name[op], style: tsHeading),
        backgroundColor: colors[op],
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("numerator:", style: tsBody),
            SizedBox(width: 80, child: TextField(controller: one, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Text("denominator:", style: tsBody),
            SizedBox(width: 10),
            SizedBox(width: 80, child: TextField(controller: two, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                double n = double.tryParse(one.text.toString());
                int m = int.parse(two.text.toString());
                if (n!=null && m!=null) {
                  answerString = legendreSymbol(n, m);
                }
                else{
                  answerString = "invalid input";
                }
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

  Widget digitalRootScaffold(BuildContext context){
    Operation op = widget.op;
    return Scaffold(
      appBar: AppBar(
        title: Text(name[op], style: tsHeading),
        backgroundColor: colors[op],
      ),
      body: Center(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 100, child: TextField(controller: one, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                if ((int.tryParse(one.text.toString())!=null) && (int.tryParse(one.text.toString())>=0)){
                  answerString = digitalRoot(int.parse(one.text.toString())).toString();
                } else {
                  answerString = "invalid input";
                }
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

  Widget baseConversionScaffold(BuildContext context) {
    Operation op = widget.op;
    List<int> bases =[2, 3, 4, 5, 6, 7, 8, 9, 10, 16];

    return Scaffold(
      appBar: AppBar(
        title: Text("Base Conversion", style: tsHeading),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 80, child: TextField(controller: one, keyboardType: TextInputType.number),),
            SizedBox(width: 10),
            Text("from Base", style: tsBody),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DropdownButton(
                value: fromBase,
                items: [
                  DropdownMenuItem(
                    child: Text("2"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("3"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("4"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("5"),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text("6"),
                    value: 5,
                  ),
                  DropdownMenuItem(
                    child: Text("7"),
                    value: 6,
                  ),
                  DropdownMenuItem(
                    child: Text("8"),
                    value: 7,
                  ),
                  DropdownMenuItem(
                    child: Text("9"),
                    value: 8,
                  ),
                  DropdownMenuItem(
                    child: Text("10"),
                    value: 9,
                  ),DropdownMenuItem(
                    child: Text("16"),
                    value: 10,
                  ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    fromBase = newValue;
                  });
                }
              ) // learned how to use DropdownButton from Lucy's code
            ),
            SizedBox(height: 20),
            Text("to Base", style: tsBody),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: DropdownButton(
                  value: toBase,
                  items: [
                    DropdownMenuItem(
                      child: Text("2"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("5"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("6"),
                      value: 5,
                    ),
                    DropdownMenuItem(
                      child: Text("7"),
                      value: 6,
                    ),
                    DropdownMenuItem(
                      child: Text("8"),
                      value: 7,
                    ),
                    DropdownMenuItem(
                      child: Text("9"),
                      value: 8,
                    ),
                    DropdownMenuItem(
                      child: Text("10"),
                      value: 9,
                    ),DropdownMenuItem(
                      child: Text("16"),
                      value: 10,
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      toBase = newValue;
                    });
                  }
                )
            ),
            SizedBox(height: 20),
            Container(
              width: 40,
              height: 40,
              child: RaisedButton(child: Text("=", style: tsBody), onPressed: () {setState(() {
                answerString = baseConversion(one.text.toString(), bases.elementAt(fromBase-1), bases.elementAt(toBase-1));
              });},
                  padding: EdgeInsets.only(left: 5, right: 5)),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              child: Text('$answerString', style: tsBody),
            ),
          ],
        ),
      ),
    );
  }

}