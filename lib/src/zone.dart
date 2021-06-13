import 'package:flutter/material.dart';
import 'package:zone/src/components/dialog_manager.dart';
import 'package:zone/src/locator.dart';
import 'package:zone/src/services/dialog_service.dart';
import 'package:zone/src/services/navigation_service.dart';
import 'package:zone/src/ui/router.dart';
import 'package:zone/src/ui/shared/app_colors.dart';
import 'package:zone/src/ui/views/sign_in_view.dart';

class Zone extends StatelessWidget {
  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zone',
      builder: (BuildContext context, Widget? child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (RouteSettings settings) => MaterialPageRoute<Widget>(
          builder: (BuildContext context) => DialogManager(child: child!),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: SignInView(),
      onGenerateRoute: generateRoute,
    );
  }
}
