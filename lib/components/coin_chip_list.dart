import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';

class CoinChipList extends StatefulWidget {
  const CoinChipList({Key? key}) : super(key: key);

  @override
  _CoinChipListState createState() => _CoinChipListState();
}

class _CoinChipListState extends State<CoinChipList> {
  int _selectedCurrency = -1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: currencies.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var currency = currencies[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 8),
            child: ChoiceChip(
              selected: _selectedCurrency == index,
              onSelected: (value) {
                setState(() {
                  _selectedCurrency = index;
                });
              },
              selectedColor: theme.primaryColor,
              label: Text(currency),
              labelStyle: theme.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
              backgroundColor: theme.cardColor,
              padding: EdgeInsets.all(12),
            ),
          );
        },
      ),
    );
  }
}
