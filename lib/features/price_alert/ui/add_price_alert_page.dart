import 'package:cryptox/app_config/app_config.dart';
import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/components/currency_drop_down_button.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPriceAlertPage extends StatefulWidget {
  @override
  _AddPriceAlertPageState createState() => _AddPriceAlertPageState();
}

class _AddPriceAlertPageState extends State<AddPriceAlertPage> {
  TextEditingController _controller = TextEditingController();
  String selectedCurrency = "USD";

  final List<double> _percentages = [-20, -10, -5, 5, 10, 20];
  int _selectedPercentage = -1;
  bool _alertOnceSelected = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CryptoCoin coin = ModalRoute.of(context)!.settings.arguments as CryptoCoin;
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          s.add_price_alert.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CoinImage(image: coin.image),
              Text(
                coin.name + " (" + coin.shortName.toUpperCase() + ")",
                style: theme.textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "${AppConfig.currency} ${coin.price}",
            style: theme.textTheme.headline5,
          ),
          SizedBox(height: 8),
        ],
      ),
      secondChild: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  s.alert_me_when,
                  style: theme.textTheme.caption,
                ),
                SizedBox(height: 8),
                Text(
                  "1" + coin.shortName.toUpperCase() + "\n=",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.subtitle1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(AppConfig.currency, textAlign: TextAlign.end),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        controller: _controller,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    CurrencyDropDownButton(
                      value: selectedCurrency,
                      onChanged: (value) {
                        setState(() {
                          selectedCurrency = value as String;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: _percentages.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var percentage = _percentages[index];
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 8),
                        child: ChoiceChip(
                          selected: _selectedPercentage == index,
                          onSelected: (value) {
                            setState(() {
                              _selectedPercentage = index;
                              _controller.text =
                                  (coin.price * (1 + (percentage / 100)))
                                      .toString();
                            });
                          },
                          selectedColor: percentage < 0
                              ? Colors.red
                              : theme.primaryColorLight,
                          label: Text("$percentage%"),
                          labelStyle: theme.textTheme.caption!.copyWith(
                              color: _selectedPercentage == index
                                  ? theme.textSelectionTheme.cursorColor
                                  : theme.textTheme.caption!.color),
                          backgroundColor: theme.scaffoldBackgroundColor,
                          padding: EdgeInsets.zero,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  s.when_the_price,
                  style: theme.textTheme.caption,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Buttons.customButton(
                        context,
                        onTap: () {
                          setState(() {
                            _alertOnceSelected = true;
                          });
                        },
                        icon: Icons.notification_important,
                        text: s.alert_once,
                        isBgColored: _alertOnceSelected,
                        isIconGradient: !_alertOnceSelected,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Buttons.customButton(
                        context,
                        onTap: () {
                          setState(() {
                            _alertOnceSelected = false;
                          });
                        },
                        icon: Icons.sync,
                        text: s.recurring,
                        isBgColored: !_alertOnceSelected,
                        isIconGradient: _alertOnceSelected,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 20,
              child: Buttons.customButton(context, onTap: () {})),
        ],
      ),
      isBgColored: false,
    );
  }
}
