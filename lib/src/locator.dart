import 'package:get_it/get_it.dart';
import 'package:zone/src/services/authentication_service.dart';
import 'package:zone/src/services/cloud_storage_service.dart';
import 'package:zone/src/services/dialog_service.dart';
import 'package:zone/src/services/firestore_service.dart';
import 'package:zone/src/services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
}
