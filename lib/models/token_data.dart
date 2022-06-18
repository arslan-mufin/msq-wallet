import 'package:cryptox/assets/assets.dart';

class Token {
  final String coinImage;
  final String token;
  final double balance;
  final String balanceIn;
  final double value;
  final double valuePerCoin;

  Token(
    this.coinImage,
    this.token,
    this.balance,
    this.balanceIn,
    this.value,
    this.valuePerCoin,
  );
}

List<Token> tokens = [
  Token(Assets.btcIcon, "OXF41FA837908C0318A9AB", 6.847724012855250549, "ETH",
      14452.12, 2110.50),
  Token(Assets.btcIcon, "01HGIFA837908C0318A57A", 12.847724114175250435, "BTC",
      58742.12, 2110.50),
];
