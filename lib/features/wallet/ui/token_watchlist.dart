import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/features/wallet/ui/token_content.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/token_data.dart';
import 'package:flutter/material.dart';

class TokensWatchlist extends StatelessWidget {
  final bool _showList;

  TokensWatchlist(this._showList);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    if (_showList) {
      return Expanded(
        child: ListView.builder(
          itemCount: tokens.length,
          itemBuilder: (context, index) {
            var token = tokens[index];
            return Card(
              margin: EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                child: TokenContent(token),
              ),
            );
          },
        ),
      );
    } else {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Image.asset(Assets.emptyPortfolio),
              SizedBox(height: 20),
              Text(s.no_token),
              SizedBox(height: 12),
              Text(
                s.add_address_to_add,
                style: theme.textTheme.caption,
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      );
    }
  }
}
