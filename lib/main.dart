import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zone/src/locator.dart';
import 'package:zone/src/zone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await setupLocator();

  runApp(Zone());
}
