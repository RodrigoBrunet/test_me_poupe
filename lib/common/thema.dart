import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ThemeData ApplicationTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
  );
}
