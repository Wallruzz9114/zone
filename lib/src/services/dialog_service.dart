import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:zone/src/components/app_dialog_request.dart';
import 'package:zone/src/components/dialog_response.dart';

class DialogService {
  final GlobalKey<NavigatorState> _dialogNavigationKey =
      GlobalKey<NavigatorState>();
  late Function(AppDialogRequest) _showDialogListener;
  late Completer<AppDialogResponse>? _dialogCompleter;
  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;

  void registerDialogListener(Function(AppDialogRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AppDialogResponse> showDialog({
    required String title,
    required String description,
    String buttonTitle = 'Ok',
  }) {
    _dialogCompleter = Completer<AppDialogResponse>();
    _showDialogListener(AppDialogRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));

    return _dialogCompleter!.future;
  }

  Future<AppDialogResponse> showConfirmationDialog({
    required String title,
    required String description,
    String confirmationTitle = 'Ok',
    String cancelTitle = 'Cancel',
  }) {
    _dialogCompleter = Completer<AppDialogResponse>();
    _showDialogListener(AppDialogRequest(
      title: title,
      description: description,
      buttonTitle: confirmationTitle,
      cancelTitle: cancelTitle,
    ));

    return _dialogCompleter!.future;
  }

  void dialogComplete(AppDialogResponse response) {
    _dialogNavigationKey.currentState!.pop();
    _dialogCompleter!.complete(response);
    _dialogCompleter = null;
  }
}
