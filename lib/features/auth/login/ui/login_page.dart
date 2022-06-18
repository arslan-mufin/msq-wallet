import 'package:country_code_picker/country_code_picker.dart';
import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/features/account/ui/language_sheet.dart';
import 'package:cryptox/features/auth/auth_interactors.dart';
import 'package:cryptox/features/auth/login_navigator.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/logic/variables.dart';
import 'package:flutter/material.dart';

part 'login_ui.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  Widget build(BuildContext context) {
    return LoginUI(this);
  }

  @override
  void loginWithFacebook() {
    Navigator.pushNamed(context, LoginRoutes.registration);
  }

  @override
  void loginWithGoogle() {
    Navigator.pushNamed(context, LoginRoutes.registration);
  }

  @override
  void loginWithMobile(String isoCode, String mobileNumber) {
    Navigator.pushNamed(context, LoginRoutes.registration,
        arguments: mobileNumber);
  }
}
