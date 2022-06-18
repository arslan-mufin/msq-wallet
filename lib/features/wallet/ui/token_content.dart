import 'package:cryptox/app_config/app_config.dart';
import 'package:cryptox/components/token_row.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/token_data.dart';
import 'package:flutter/material.dart';

class TokenContent extends StatelessWidget {
  final Token token;

  TokenContent(this.token);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TokenRow(token),
        SizedBox(height: 8),
        Text(
          s.balance,
          style: theme.textTheme.caption,
        ),
        Text(
          token.balance.toString() + " " + token.balanceIn,
          style:
              theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          s.value,
          style: theme.textTheme.caption,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${AppConfig.currency} " + token.value.toString(),
                style: theme.textTheme.bodyText2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " (@${AppConfig.currency}" +
                    token.valuePerCoin.toString() +
                    "/" +
                    token.balanceIn +
                    ")",
                style: theme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.disabledColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
