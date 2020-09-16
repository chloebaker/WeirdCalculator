library baseconvert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:baseconvert/baseconvert.dart'; // got this from https://pub.dev/packages/baseconvert

enum Operation {
  Modulo,
  DigitalRoot,
  LunarAddition,
  BaseConversion,
  LegendreSymbol
}

Map<Operation, String> name = {
  Operation.Modulo: "Modulo",
  Operation.DigitalRoot: "Digital Root",
  Operation.LunarAddition: "Lunar Addition",
  Operation.BaseConversion: "Base Conversion",
  Operation.LegendreSymbol: "Legendre Symbol"
};

Map<Operation, Color> colors = {
  Operation.Modulo: Colors.redAccent,
  Operation.DigitalRoot: Colors.orangeAccent,
  Operation.LunarAddition: Colors.greenAccent,
  Operation.BaseConversion: Colors.blueAccent,
  Operation.LegendreSymbol: Colors.deepPurpleAccent
};

Map<Operation, int Function(int,int)> operations = {
  Operation.Modulo: (a,b) => a%b,
  Operation.LunarAddition: (a,b) => lunarAddition(a, b)
};

Map<Operation, String> opSymbol = {
  Operation.Modulo: "mod",
  Operation.LunarAddition: "+",
  Operation.LegendreSymbol: "denominator:"
};

Map<Operation, int> numInputs = {
  Operation.Modulo: 2,
  Operation.DigitalRoot: 1,
  Operation.LunarAddition: 2,
  Operation.BaseConversion: 3,
  Operation.LegendreSymbol: 2
};

String legendreSymbol(double num, int p) {
  double m = sqrt(num%p);
  if (!prime(p)) {
    return "invalid input";
  }
  if (num%p!=0) {
    if (m-(m.round())==0) {
      return '1';
    }
    return "-1";
  }
  return '0';
}

String baseConversion(dynamic num, int from, int to) {
  try {
    return base(num, inBase: from, outBase: to, string: true);
  } on Exception {
    return "invalid input";
  }
}

int digitalRoot(int num) {
  int sum = 0;
  int n = num;
  while(n>0){
    sum += n%10;
    n = ((n-(n%10))/10).round();
  }
  if (sum>=10) {
    return digitalRoot(sum);
  }
  return sum;
}

int lunarAddition(int a, int b) {
  int n = a;
  int m = b;
  int place = 1;
  int sum = 0;
  while(n>0 || m>0) {
    sum += max(n%10, m%10)*place;
    place *= 10;
    n = ((n-(n%10))/10).round();
    m = ((m-(m%10))/10).round();
  }
  return sum;
}

int max(int a, int b) {
  if (a>b) {
    return a;
  }
  return b;
}

bool prime(int a) {
  int i = 2;
  if(a<3) {
    return false;
  }
  while (i<a){
    if (a%i==0){
      return false;
    }
    i += 1;
  }
  return true;
}


