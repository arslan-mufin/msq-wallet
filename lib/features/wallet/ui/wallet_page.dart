import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'coin_grid.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          s.token_wallet.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      firstChild: null,
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.token_wallets,
            style:
                theme.textTheme.bodyText2!.copyWith(color: theme.dividerColor),
          ),
          SizedBox(height: 20),
          TokenList(),
        ],
      ),
      secondChildPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
    );
  }
}
