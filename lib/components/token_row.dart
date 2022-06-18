import 'package:cryptox/models/token_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'coin_image.dart';

class TokenRow extends StatelessWidget {
  final Token token;

  TokenRow(this.token);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        CoinImage(
          image: token.coinImage,
          bgColor: theme.backgroundColor,
        ),
        SizedBox(width: 8),
        Flexible(
          child: Text(
            token.token,
            overflow: TextOverflow.ellipsis,
            style:
                theme.textTheme.bodyText2!.copyWith(color: theme.primaryColor),
          ),
        ),
        IconButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: token.token));
          },
          icon: Icon(Icons.copy),
          iconSize: 20,
          color: theme.disabledColor,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
          iconSize: 20,
          color: theme.disabledColor,
        ),
      ],
    );
  }
}
