import 'package:cryptox/assets/assets.dart';
import 'package:fl_chart/fl_chart.dart';

class CryptoCoin {
  final String image;
  final String shortName;
  final String name;
  final double price;
  final double move;
  final double holdings;
  final double noOfCoins;
  final List<FlSpot> flSpots;

  CryptoCoin(this.image, this.shortName, this.name, this.price, this.move,
      this.holdings, this.noOfCoins, this.flSpots);
}

final List<CryptoCoin> cryptoCoinsList = [
  CryptoCoin(Assets.aaveIcon, "aave", "Aave", 50.0, -20.0, 75.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.adaIcon, "ada", "Ada", 50.0, 10.0, 75.0, 1.25, [
    FlSpot(1, 2),
    FlSpot(2, 4),
    FlSpot(4, 6),
    FlSpot(6, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.algoIcon, "algo", "Algo", 50.0, -0.5, 75.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8.5, 4.5),
    FlSpot(9.5, 4),
    FlSpot(9.7, 4.5),
    FlSpot(12, 4),
  ]),
  CryptoCoin(Assets.ampIcon, "amp", "Amp", 50.0, 8.0, 75.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.ancIcon, "anc", "Anc", 50.0, 0.85, 75.0, 1.25, [
    FlSpot(1, 2),
    FlSpot(2, 4),
    FlSpot(4.5, 6),
    FlSpot(6.7, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.atomIcon, "atom", "Atom", 50.0, 3.25, 75.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8.5, 4.5),
    FlSpot(9.5, 4),
    FlSpot(9.7, 4.5),
    FlSpot(12, 4),
  ]),
  CryptoCoin(Assets.avaxIcon, "avax", "Avax", 50.0, -5.0, 75.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.axsIcon, "axs", "Axs", 50.0, 0.0, 75.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8.5, 4.5),
    FlSpot(9.5, 4),
    FlSpot(9.7, 4.5),
    FlSpot(12, 4),
  ]),
  CryptoCoin(Assets.bakeIcon, "bake", "Bake", 250.0, 0.0, 7456.45, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.balIcon, "bal", "Bal", 150.0, 0.0, 74.46, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.bchIcon, "bch", "Bch", 4550.0, 0.0, 495.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8.5, 4.5),
    FlSpot(9.5, 4),
    FlSpot(9.7, 4.5),
    FlSpot(12, 4),
  ]),
  CryptoCoin(Assets.bestIcon, "best", "Best", 5015.0, 0.0, 85.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(
      Assets.bnbIcon, "bnb", "Binance Coin", 38102.0, 0.0, 34023.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.bsv1Icon, "bsv1", "Bsv1", 5460.0, 0.0, 750.0, 1.25, [
    FlSpot(1, 3),
    FlSpot(2.6, 4),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.btcIcon, "btc", "Bitcoin", 38563.0, 0.0, 35045.0, 1.25, [
    FlSpot(1, 2),
    FlSpot(2, 4),
    FlSpot(4, 6),
    FlSpot(6, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.bttIcon, "btt", "Bitt", 4563.0, 0.0, 15045.0, 1.25, [
    FlSpot(1, 2),
    FlSpot(2, 4),
    FlSpot(4, 6),
    FlSpot(6, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
  CryptoCoin(Assets.busdIcon, "busd", "Busd", 3856.0, 0.0, 3505.0, 1.25, [
    FlSpot(1, 2),
    FlSpot(2, 4),
    FlSpot(4, 6),
    FlSpot(6, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 5),
    FlSpot(10, 4.5),
    FlSpot(11, 4),
  ]),
];

List<String> currencies = ["USD", "INR", "EURO", "BTC", "ETH"];
