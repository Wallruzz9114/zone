import 'package:zone/src/constants/route_names.dart';
import 'package:zone/src/locator.dart';
import 'package:zone/src/models/viewmodels/base_model.dart';
import 'package:zone/src/services/authentication_service.dart';
import 'package:zone/src/services/dialog_service.dart';
import 'package:zone/src/services/navigation_service.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    setBusy(true);
    final dynamic result = await _authenticationService.signUpWithEmail(
        email: email, password: password);
    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(RootViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result.toString(),
      );
    }
  }
}
