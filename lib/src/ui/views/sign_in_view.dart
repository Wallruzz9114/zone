import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zone/src/constants/route_names.dart';
import 'package:zone/src/locator.dart';
import 'package:zone/src/models/viewmodels/sign_in_view_model.dart';
import 'package:zone/src/services/navigation_service.dart';
import 'package:zone/src/ui/shared/ui_helpers.dart';
import 'package:zone/src/ui/widgets/busy_button.dart';
import 'package:zone/src/ui/widgets/input_field.dart';
import 'package:zone/src/ui/widgets/text_link.dart';

class SignInView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  ViewModelBuilder<SignInViewModel> build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (BuildContext builder, SignInViewModel model, Widget? child) =>
          Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/title.png'),
              ),
              InputField(placeholder: 'Email', controller: emailController),
              verticalSpaceSmall,
              InputField(
                controller: passwordController,
                placeholder: 'Password',
                password: true,
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  BusyButton(
                    title: 'Sign in',
                    busy: model.busy,
                    onPressed: () {
                      model.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                ],
              ),
              verticalSpaceMedium,
              TextLink(
                "Create an Account if you're new.",
                onPressed: () {
                  _navigationService.navigateTo(SignInViewRoute);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
