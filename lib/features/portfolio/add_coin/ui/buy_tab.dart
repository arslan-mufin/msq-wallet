import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/coin_chip_list.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

class BuyTab extends StatefulWidget {
  @override
  _BuyTabState createState() => _BuyTabState();
}

class _BuyTabState extends State<BuyTab> {
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: s.amount_of_coins,
                padding: EdgeInsetsDirectional.only(end: 20, bottom: 20),
              ),
              Text(s.currency, style: theme.textTheme.caption),
              CoinChipList(),
              CustomTextField(
                label: s.buying_price,
                padding:
                    EdgeInsetsDirectional.only(top: 16, end: 20, bottom: 20),
              ),
              CustomTextField(
                controller: _dateController,
                label: s.bought_on,
                padding:
                    EdgeInsetsDirectional.only(top: 16, end: 20, bottom: 20),
                readOnly: true,
                suffixIcon: ShaderMask(
                  shaderCallback: AppTheme.shaderCallback,
                  child: Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    var date = DateTime.now();
                    if (value != null) date = value;
                    setState(() {
                      _dateController.text =
                          "${date.day}/${date.month}/${date.year}";
                    });
                  });
                },
              ),
              // Spacer(flex: 5),
              SizedBox(
                height: 60,
              ),
              // Spacer(flex: 2),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: 20,
          start: 0,
          end: 0,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 20),
            child: Buttons.customButton(context, onTap: () {}, text: s.submit),
          ),
        ),
      ],
    );
  }
}
