import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/features/chart/ui/line_chart.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CryptocurrencyCoinRow extends DataRow {
  final CryptoCoin coin;
  final ThemeData theme;

  CryptocurrencyCoinRow(BuildContext context, this.coin, this.theme)
      : super(
          cells: [
            DataCell(CoinImage(image: coin.image)),
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coin.shortName.toUpperCase()),
                  Text(
                    coin.name,
                    style: theme.textTheme.caption,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            DataCell(
              CustomChart(
                coin.move < 0 ? Colors.red : AppTheme.upColor,
                coin.flSpots,
              ),
            ),
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$ ${coin.price}"),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        coin.move.toString().replaceFirst("-", "") + "%",
                        style: theme.textTheme.overline!.copyWith(
                            color:
                                coin.move < 0 ? Colors.red : AppTheme.upColor),
                      ),
                      if (coin.move < 0)
                        Icon(Icons.arrow_drop_down, color: Colors.red, size: 20)
                      else
                        Icon(
                          Icons.arrow_drop_up,
                          color: AppTheme.upColor,
                          size: 20,
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
          onSelectChanged: (value) => Navigator.pushNamed(
            context,
            PageRoutes.coinDetailsPage,
            arguments: coin,
          ),
        );
}
