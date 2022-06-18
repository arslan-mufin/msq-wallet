import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';

class CurrencyDropDownButton extends StatelessWidget {
  final String value;
  final ValueChanged<String?>? onChanged;

  CurrencyDropDownButton({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DropdownButton(
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: theme.primaryColor,
      ),
      underline: SizedBox.shrink(),
      dropdownColor: theme.cardColor,
      value: value,
      style: theme.textTheme.bodyText1,
      onChanged: onChanged,
      items: currencies
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
    );
  }
}
