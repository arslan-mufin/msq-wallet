import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/features/auth/auth_interactors.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

part 'verification_ui.dart';

class VerificationPage extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationPage(this.onVerificationDone);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    implements VerificationInteractor {
  @override
  Widget build(BuildContext context) {
    return VerificationUI(this);
  }

  @override
  void verify() {
    widget.onVerificationDone();
  }
}
