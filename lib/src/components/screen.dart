import 'package:flutter/material.dart';

class Screen {
  Screen({
    required this.title,
    required this.child,
    required this.onGenerateRoute,
    required this.initialRoute,
    required this.navigatorState,
    required this.scrollController,
  });

  final String title;
  final Widget child;
  final RouteFactory onGenerateRoute;
  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorState;
  final ScrollController scrollController;
}
