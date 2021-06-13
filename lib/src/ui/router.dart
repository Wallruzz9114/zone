import 'package:flutter/material.dart';
import 'package:zone/src/constants/route_names.dart';
import 'package:zone/src/ui/views/home_view.dart';
import 'package:zone/src/ui/views/root_view.dart';
import 'package:zone/src/ui/views/sign_in_view.dart';
import 'package:zone/src/ui/views/sign_up_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: SignInView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const HomeView(),
      );
    case RootViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: RootView(),
      );
    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<RouteSettings> _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return MaterialPageRoute<RouteSettings>(
    settings: RouteSettings(name: routeName),
    builder: (_) => viewToShow,
  );
}
