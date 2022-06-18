import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/coin_chip_list.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

class SellTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
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
              label: s.selling_price,
              padding: EdgeInsetsDirectional.only(top: 16, end: 20, bottom: 20),
            ),
            Spacer(flex: 5),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 20),
              child:
                  Buttons.customButton(context, onTap: () {}, text: s.submit),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
