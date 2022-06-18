import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';

class PriceAlertCoinTile extends StatelessWidget {
  final CryptoCoin coin;

  PriceAlertCoinTile(this.coin);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          CoinImage(image: coin.image),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(coin.shortName.toUpperCase()),
              Text(coin.name, style: theme.textTheme.caption),
            ],
          ),
          Spacer(),
          Text("\$ ${coin.price}  ≥ "),
          ShaderMask(
            shaderCallback: AppTheme.shaderCallback,
            child: Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
