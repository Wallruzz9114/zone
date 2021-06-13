import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zone/src/models/viewmodels/sign_up_view_model.dart';
import 'package:zone/src/ui/shared/ui_helpers.dart';
import 'package:zone/src/ui/widgets/busy_button.dart';
import 'package:zone/src/ui/widgets/input_field.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  ViewModelBuilder<SignUpViewModel> build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (BuildContext context, SignUpViewModel model, Widget? child) =>
          Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Sign Up', style: TextStyle(fontSize: 38)),
              verticalSpaceLarge,
              InputField(controller: emailController, placeholder: 'Email'),
              verticalSpaceSmall,
              InputField(
                controller: passwordController,
                placeholder: 'Password',
                password: true,
                additionalNote:
                    'Password has to be at least 6 characters long.',
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  BusyButton(
                    title: 'Sign Up',
                    busy: model.busy,
                    onPressed: () {
                      model.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
