import 'package:cryptox/assets/assets.dart';

class Exchange {
  final String image;
  final String name;
  final double exchange;
  final double volume;

  Exchange(this.image, this.name, this.exchange, this.volume);
}

List<Exchange> exchanges = [
  Exchange(Assets.binance, "Binance", 10.0, 36700.0),
  Exchange(Assets.huobi, "Huobi Global", 10.0, 2591084785.0),
  Exchange(Assets.coinbase, "Coinbase Exchange", 9.9, 1416094150.0),
  Exchange(Assets.ftx, "FTX", 9.5, 744847417.0),
  Exchange(Assets.kraken, "Kraken", 9.5, 578405019.0),
  Exchange(Assets.bithumb, "Bithumb", 9.2, 658248808.0),
  Exchange(Assets.gate_io, "Gate.io", 9.1, 364228596.0),
];
