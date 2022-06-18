import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PortfolioCoinRow extends DataRow {
  final CryptoCoin coin;
  final ThemeData theme;

  PortfolioCoinRow(this.coin, this.theme, BuildContext context)
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
                  ),
                ],
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
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("\$ ${coin.holdings}"),
                        Text(
                          "${coin.noOfCoins} ${coin.shortName.toUpperCase()}",
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    child: Icon(Icons.add, size: 20),
                    onTap: () => Navigator.pushNamed(
                        context, PageRoutes.addTransactionPage,
                        arguments: coin),
                  ),
                ],
              ),
            ),
          ],
        );
}
