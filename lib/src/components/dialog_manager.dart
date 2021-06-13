import 'package:flutter/material.dart';
import 'package:zone/src/components/app_dialog_request.dart';
import 'package:zone/src/components/dialog_response.dart';
import 'package:zone/src/locator.dart';
import 'package:zone/src/services/dialog_service.dart';

class DialogManager extends StatefulWidget {
  const DialogManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  void _showDialog(AppDialogRequest request) {
    final bool isConfirmationDialog = request.cancelTitle != null;

    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(request.description),
        actions: <Widget>[
          if (isConfirmationDialog)
            TextButton(
              onPressed: () {
                _dialogService
                    .dialogComplete(AppDialogResponse(confirmed: false));
              },
              child: Text(request.title),
            ),
          TextButton(
            onPressed: () {
              _dialogService
                  .dialogComplete(AppDialogResponse(confirmed: false));
            },
            child: Text(request.title),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
