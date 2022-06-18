import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).my_account.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: null,
      secondChild: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  initialValue: "Samantha Smith",
                  label: S.of(context).full_name,
                  showUnderline: false,
                ),
                CustomTextField(
                  initialValue: "samanthasmith@mail.com",
                  label: S.of(context).email_address,
                  showUnderline: false,
                ),
                CustomTextField(
                  initialValue: "+91 9876543210",
                  label: S.of(context).phone_number,
                  showUnderline: false,
                  readOnly: true,
                ),
                SizedBox(height: 140),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Buttons.customButton(
              context,
              onTap: () => Phoenix.rebirth(context),
              text: S.of(context).logout,
              isBgColored: false,
              textColor: theme.textSelectionTheme.cursorColor,
            ),
          ),
        ],
      ),
    );
  }
}
