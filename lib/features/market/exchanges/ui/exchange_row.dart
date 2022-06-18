import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/models/exchange_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';

class ExchangeRow extends DataRow {
  final Exchange exchange;
  final ThemeData theme;
  final context;

  ExchangeRow(this.exchange, this.theme, this.context)
      : super(
          cells: [
            DataCell(
              CoinImage(
                image: exchange.image,
              ),
                onTap: (){
                  Navigator.pushNamed(context, PageRoutes.exchangesTabOptions);
                }
            ),
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exchange.name),
                  Text(
                    exchange.exchange.toString(),
                    style: theme.textTheme.caption!
                        .copyWith(color: theme.primaryColorLight),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
                onTap: (){
                  Navigator.pushNamed(context, PageRoutes.exchangesTabOptions);
                }
            ),
            DataCell(Text("\$ ${exchange.volume}"),
                onTap: (){
                  Navigator.pushNamed(context, PageRoutes.exchangesTabOptions);
                }),
          ],
        );
}
