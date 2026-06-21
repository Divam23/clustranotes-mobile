import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  // Base Radius
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 6;
  static const double md = 8;
  static const double lg = 12;
  static const double xl = 16;
  static const double xxl = 24;
  static const double full = 9999;

  // Common Components
  static const BorderRadius card =
  BorderRadius.all(Radius.circular(xl));

  static const BorderRadius button =
  BorderRadius.all(Radius.circular(lg));

  static const BorderRadius chip =
  BorderRadius.all(Radius.circular(full));

  static const BorderRadius searchBarSharp =
  BorderRadius.all(Radius.circular(sm));

  static const BorderRadius searchBar =
  BorderRadius.all(Radius.circular(xl));
  
  static const BorderRadius searchBarRounded =
  BorderRadius.all(Radius.circular(full));
  
  static const BorderRadius avatar =
  BorderRadius.all(Radius.circular(full));

  static const BorderRadius dialog =
  BorderRadius.all(Radius.circular(xl));

  static const BorderRadius bottomSheet =
  BorderRadius.vertical(
    top: Radius.circular(xxl),
  );

  static const BorderRadius image =
  BorderRadius.all(Radius.circular(md));
}
