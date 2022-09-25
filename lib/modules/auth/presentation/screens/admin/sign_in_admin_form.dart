import 'package:flutter/material.dart';
import 'package:qola_app/routes.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_text_field.dart';
import 'package:qola_app/shared/qola_texts.dart';

class SignInAdminEmail extends StatelessWidget {
  const SignInAdminEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericIconFormField(hintText: 'Email', icon: Icons.mail);
  }
}

class SignInAdminPassword extends StatelessWidget {
  const SignInAdminPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericIconFormField(hintText: 'Password', icon: Icons.key);
  }
}

class SignInAdminForgotPassword extends StatelessWidget {
  const SignInAdminForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextLink(
        description: '¿Olvidó su contraseña?',
        onPressed: () {},
      ),
    );
  }
}


class SignInSubmitButton extends StatelessWidget {
  const SignInSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: LargeSolidButton(
        text: 'INGRESAR',
        onPressed: () => Navigator.pushNamed(context, RoutesPath.mainAdminPath),
      ),
    );
  }
}
