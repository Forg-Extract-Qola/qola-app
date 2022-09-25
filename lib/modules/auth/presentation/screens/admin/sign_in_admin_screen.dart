import 'package:flutter/material.dart';
import 'package:qola_app/modules/auth/presentation/screens/admin/sign_in_admin_form.dart';
import 'package:qola_app/shared/qola_pages.dart';

class SignInAdminScreen extends StatelessWidget {
  const SignInAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAuthPage(
      padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: SignInAdminForm()
    );
  }
}

class SignInAdminForm extends StatelessWidget {
  const SignInAdminForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SignInAdminEmail(),
        SignInAdminPassword(),
        SignInAdminForgotPassword(),
        SignInSubmitButton()
      ],
    );
  }
}

