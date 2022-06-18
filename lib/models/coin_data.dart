import 'package:cryptox/assets/assets.dart';

class Coin {
  final String image;
  final String icon;
  final String name;
  final String shortName;

  Coin(this.image, this.icon, this.name, this.shortName);
}

List<Coin> coins = [
  Coin(Assets.bnb, Assets.bnbIcon, "Binance", "BNB"),
  Coin(Assets.btc, Assets.btcIcon, "Bitcoin", "BTC"),
  Coin(Assets.eth, Assets.ethIcon, "Ethereum", "ETH"),
  Coin(Assets.xrp, Assets.xrpIcon, "Ripple", "XRP"),
];
