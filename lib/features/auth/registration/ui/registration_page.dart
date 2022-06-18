import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/features/auth/auth_interactors.dart';
import 'package:cryptox/features/auth/login_navigator.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

part 'registration_ui.dart';

class RegistrationPage extends StatelessWidget {
  final String? phoneNumber;

  RegistrationPage(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return RegistrationBody(phoneNumber);
  }
}

class RegistrationBody extends StatefulWidget {
  final String? phoneNumber;

  RegistrationBody(this.phoneNumber);

  @override
  _RegistrationBodyState createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody>
    implements RegistrationInteractor {
  @override
  Widget build(BuildContext context) {
    return RegistrationUI(this, widget.phoneNumber);
  }

  @override
  void resister(String name, String email) {
    Navigator.pushNamed(context, LoginRoutes.verification);
  }
}
