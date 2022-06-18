import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

class CreatePortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(S.of(context).create_portfolio),
      ),
      firstChild: null,
      secondChild: Column(
        children: [
          CustomTextField(
            label: S.of(context).portfolio_name,
            padding: EdgeInsets.only(top: 8),
          ),
          Spacer(),
          Buttons.customButton(context, onTap: () => Navigator.pop(context)),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
