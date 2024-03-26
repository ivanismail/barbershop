// ignore_for_file: prefer_const_constructors

import 'package:barbershop/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class XTheme {
  static ThemeData themeData() => ThemeData(
        colorScheme: ColorScheme.light().copyWith(primary: XColor.primary()),
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: XColor.netral1(),
      );

  static BorderRadius borderRadius({double radius = 12}) =>
      BorderRadius.circular(radius);

  static List<BoxShadow> botShadow() => [
        BoxShadow(
          color: Colors.black.withAlpha(15),
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
      ];

  static Radius radius() => Radius.circular(6);
}

const double h1 = 11;
const double h2 = 13;
const double h3 = 15;
const double h4 = 17;
const double h5 = 19;
const double h6 = 21;
const double h7 = 23;
const double h8 = 25;

//TEXT STYLE
final h1b = TextStyle(fontWeight: FontWeight.w700, fontSize: h1);
final h2b = TextStyle(fontWeight: FontWeight.w700, fontSize: h2);
final h3b = TextStyle(fontWeight: FontWeight.w700, fontSize: h3);
final h4b = TextStyle(fontWeight: FontWeight.w700, fontSize: h4);
final h5b = TextStyle(fontWeight: FontWeight.w700, fontSize: h5);
final h6b = TextStyle(fontWeight: FontWeight.w700, fontSize: h6);
final h7b = TextStyle(fontWeight: FontWeight.w700, fontSize: h7);
final h8b = TextStyle(fontWeight: FontWeight.w700, fontSize: h8);

final h1sb = TextStyle(fontWeight: FontWeight.w600, fontSize: h1);
final h2sb = TextStyle(fontWeight: FontWeight.w600, fontSize: h2);
final h3sb = TextStyle(fontWeight: FontWeight.w600, fontSize: h3);
final h4sb = TextStyle(fontWeight: FontWeight.w600, fontSize: h4);

final h1m = TextStyle(
    fontWeight: FontWeight.w500, fontSize: h1, color: XColor.netral8());
final h2m = TextStyle(
    fontWeight: FontWeight.w500, fontSize: h2, color: XColor.netral8());
final h3m = TextStyle(
    fontWeight: FontWeight.w500, fontSize: h3, color: XColor.netral8());
final h4m = TextStyle(
    fontWeight: FontWeight.w500, fontSize: h4, color: XColor.netral8());

final h1n = TextStyle(fontSize: h1);
final h2n = TextStyle(fontSize: h2);
final h3n = TextStyle(fontSize: h3);
final h4n = TextStyle(fontSize: h4);
final h5n = TextStyle(fontSize: h5);
final h6n = TextStyle(fontSize: h6);
final h7n = TextStyle(fontSize: h7);

final h1l = TextStyle(
    fontSize: h1, color: XColor.netral5(), fontWeight: FontWeight.w400);
final h2l = TextStyle(
    fontSize: h2, color: XColor.netral5(), fontWeight: FontWeight.w400);
final h3l = TextStyle(
    fontSize: h3, color: XColor.netral5(), fontWeight: FontWeight.w400);
final h4l = TextStyle(
    fontSize: h4, color: XColor.netral5(), fontWeight: FontWeight.w400);
final h5l = TextStyle(
    fontSize: h5, color: XColor.netral5(), fontWeight: FontWeight.w400);
