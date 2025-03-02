import 'package:flutter/material.dart';

class AppConstant {
  static TextStyle h1Style() =>
      TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

  static TextStyle h2Style({Color? color}) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);

  static TextStyle h3Style() =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.normal);

  static List<double> cpIntakeOld = <double>[
    3,
    7,
    12,
    17,
    24,
    31,
    40,
    49,
    59,
    70,
    82,
    94,
    108,
    123,
    139
  ];

  static List<double> meIntakeOld = <double>[
    39,
    89,
    152,
    226,
    309,
    405,
    512,
    631,
    765,
    910,
    1072,
    1252,
    1447,
    1655,
    1882
  ];
}
