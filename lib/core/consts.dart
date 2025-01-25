import 'dart:math';

import 'package:flutter/material.dart';

class Consts {
  static const String title = 'Gospel According To SQL';
  static const bool enableRad = true;
  static int get gifsCount => 7;

  static const Color color = Color.fromARGB(255, 84, 255, 13);

  static const String pathToAbout = '/about';
  static const String pathToGospel = '/gospel';
  static const String pathToPosters = '/posters';
  static const String pathToImportant = '/important';
  static const String pathToRad = '/rad';
  static const String commentRegex = r'--.+';
  static const String SQLRegex =
      r'(?<=\W|^)(SELECT|FROM|WHERE|ON|JOIN|AND|OR|GROUP|BY|HAVING|ORDER|INNER|OUTER|LEFT|RIGHT|JOIN|IF|EXISTS|NOT|CREATE|UPDATE|DELETE|INDEX|GO|GOTO|DBCC|ALTER|DROP|WITH|AS|CROSS|APPLY|DATABASE|SET|WITH|DECLARE|UNION|INTERSECT|EXCEPT|ALL|INSERT|PRIMARY|FOREIGN|KEY|UNIQUE|CONSTRAINT|BEGIN|END|TRY|CATCH|TABLE|VIEW|ADD|REFERENCES|USE|ASC|DESC)(?=\W|$)';
  static const String importantUrl =
      'https://www.youtube.com/embed/dQw4w9WgXcQ?rel=0&amp;controls=0&amp;showinfo=0&amp;autoplay=1';

  static const double dispatcherBoxSize = 250;

  static const double fieldsBoxSize = 200;

  static const double posterHeight = 539;
  static const double posterWidth = 376;

  static const TextStyle typography = TextStyle(
    fontFamily: 'RobotoMono',
    color: Colors.black,
    fontSize: 16,
  );

  static const TextStyle typographyEmoji = TextStyle(
    fontFamily: 'RobotoMono',
    color: Colors.black,
    fontSize: 32,
  );

  static const TextStyle typographyHeader = TextStyle(
    fontFamily: 'RobotoMono',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle typographyDispatcher = TextStyle(
    fontFamily: 'RobotoMono',
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static double get dispatcherIconSize => max(dispatcherBoxSize - 75, 0);

  static double get padding => 10;

  static const quick = Duration(milliseconds: 200);
  static const fadeWarmup = Duration(milliseconds: 1000);
  static const fadeLinger = Duration(milliseconds: 2000);
  static const fadeSustain = Duration(milliseconds: 4000);
}
