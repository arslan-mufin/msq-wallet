import 'dart:convert';

import 'package:cryptox/app_config/app_config.dart';
import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/features/chart/ui/line_chart.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';
import 'package:k_chart/entity/k_line_entity.dart';
import 'package:cryptox/generated/l10n.dart' as locale;
import 'package:k_chart/flutter_k_chart.dart';

class ExchangesTabOptions extends StatefulWidget {
  @override
  _ExchangesTabOptionsState createState() => _ExchangesTabOptionsState();
}

class _ExchangesTabOptionsState extends State<ExchangesTabOptions> {
  String selectedCurrency = "USD";

  List<KLineEntity> datas = [];

  List<String> _durations = ["24H", "1W", "1M", "1Y", "ALL"];
  int _selectedDuration = -1;

  bool isLine = false;
  bool isFavourite = false;

  getData() async {
    var data =
    await DefaultAssetBundle.of(context).loadString(Assets.chartData);
    final parseJson = json.decode(data);
    final list = parseJson['data'] as List<dynamic>;
    datas = list
        .map((item) => KLineEntity.fromJson(item as Map<String, dynamic>))
        .toList()
        .reversed
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    CryptoCoin coin = cryptoCoinsList[1]/*ModalRoute.of(context)!.settings.arguments as CryptoCoin*/;
    var theme = Theme.of(context);
    var s = locale.S.of(context);
    var graphColor = coin.move < 0 ? AppTheme.downColor : AppTheme.upColor;
    return CustomScaffold(
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CoinImage(
              image: coin.image,
              bgColor: theme.scaffoldBackgroundColor,
            ),
            Text(
              coin.name.split(' ')[0] ,
              style: theme.textTheme.subtitle1,
            ),
            Spacer(flex: 3,),
          ],
        ),
        textTheme: theme.appBarTheme.textTheme,
      ),
      firstChild: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 12),
        child: Column(
          children: [
            Text(
              "${AppConfig.currency} ${coin.price}",
              style: theme.textTheme.headline5,
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "("+ s.trust +" 10.0)",
                  style: theme.textTheme.subtitle2!.copyWith(color: graphColor),
                ),
              ],
            ),
          ],
        ),
      ),
      secondChild: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 32,
                    child: ListView.builder(
                      itemCount: _durations.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var duration = _durations[index];
                        return Padding(
                          padding: EdgeInsetsDirectional.only(end: 8),
                          child: ChoiceChip(
                            selected: _selectedDuration == index,
                            onSelected: (value) {
                              setState(() {
                                _selectedDuration = index;
                              });
                            },
                            selectedColor: theme.scaffoldBackgroundColor,
                            label: Text(duration),
                            labelStyle: _selectedDuration == index
                                ? theme.textTheme.bodyText1
                                : theme.textTheme.caption,
                            backgroundColor: theme.backgroundColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLine = !isLine;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 40,
                    child: isLine
                        ? Image.asset(Assets.candlestick)
                        : CustomChart(graphColor, coin.flSpots),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: datas.isNotEmpty
                ? KChartWidget(
              datas,
              ChartStyle(),
              ChartColors()
                ..upColor = AppTheme.upColor
                ..dnColor = AppTheme.downColor
                ..kLineColor = graphColor
                ..lineFillColor = graphColor,
              secondaryState: SecondaryState.NONE,
              isLine: isLine,
              bgColor: [theme.backgroundColor, theme.backgroundColor],
            )
                : null,
          ),
          SizedBox(height: 20),
          if (datas.isNotEmpty)
            Column(
              children: [
                buildListTile(s.market_cap_rank, 1, "#"),
                buildListTile(s.market_cap, datas.first.open),
                buildListTile(s.year_of_establishment, 2017, ''),
                buildListTile(s.trading_vol, datas.first.vol),
                // buildListTile(s.h_high, datas.first.high),
              ],
            ),
        ],
      ),
      isBgColored: false,
      secondChildPadding: EdgeInsetsDirectional.only(top: 20, end: 20),
    );
  }

  Widget buildListTile(String text, double value,
      [String symbol = AppConfig.currency]) {
    return Container(
      height: 32,
      child: ListTile(
        contentPadding: EdgeInsetsDirectional.only(start: 30, end: 4),
        title: Text(text, style: Theme.of(context).textTheme.caption),
        trailing: Text(symbol + value.toStringAsFixed(0)),
      ),
    );
  }
}