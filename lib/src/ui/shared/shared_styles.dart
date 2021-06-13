import 'package:flutter/material.dart';

BoxDecoration fieldDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[200],
);

BoxDecoration disabledFieldDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[100],
);

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    EdgeInsets.symmetric(horizontal: 15, vertical: 15);
const TextStyle buttonTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w700, color: Colors.white);
