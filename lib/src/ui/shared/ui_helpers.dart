import 'package:flutter/material.dart';

const SizedBox horizontalSpaceTiny = SizedBox(width: 5.0);
const SizedBox horizontalSpaceSmall = SizedBox(width: 10.0);
const SizedBox horizontalSpaceMedium = SizedBox(width: 25.0);
const SizedBox verticalSpaceTiny = SizedBox(height: 5.0);
const SizedBox verticalSpaceSmall = SizedBox(height: 10.0);
const SizedBox verticalSpaceMedium = SizedBox(height: 25.0);
const SizedBox verticalSpaceLarge = SizedBox(height: 50.0);
const SizedBox verticalSpaceMassive = SizedBox(height: 120.0);

Column spacedDivider = Column(
  children: const <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

SizedBox verticalSpace(double height) => SizedBox(height: height);
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);
