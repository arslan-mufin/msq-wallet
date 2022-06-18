import 'package:cryptox/components/constants.dart';

class Nft {
  final String image;
  final String name;
  final int number;
  final String clubName;
  final String bodyType;
  final String environment;
  final String headType;
  final String lowerPow;
  final String description;

  Nft(
    this.image,
    this.name,
    this.number,
    this.clubName,
    this.bodyType,
    this.environment,
    this.headType,
    this.lowerPow, [
    this.description = kLoremText1,
  ]);
}
