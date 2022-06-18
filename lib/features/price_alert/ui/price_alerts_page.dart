import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';

import 'price_alert_coin_tile.dart';

class PriceAlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).price_alerts.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: null,
      secondChild: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: 2,
              itemBuilder: (context, index) {
                var coin = cryptoCoinsList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.only(bottom: 16),
                  child: PriceAlertCoinTile(coin),
                );
              },
            ),
          ),
          Spacer(),
          Text(
            S.of(context).when_the_price,
            style: theme.textTheme.caption,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}
