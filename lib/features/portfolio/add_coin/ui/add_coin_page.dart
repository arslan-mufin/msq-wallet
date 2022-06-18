import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).add_coin.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      firstChild: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: theme.disabledColor),
          hintText: S.of(context).search_coin,
          hintStyle:
              theme.textTheme.subtitle1!.copyWith(color: theme.disabledColor),
        ),
      ),
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).popular_cryptos,
            style:
                theme.textTheme.subtitle1!.copyWith(color: theme.disabledColor),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 8),
              physics: BouncingScrollPhysics(),
              itemCount: cryptoCoinsList.length,
              itemBuilder: (context, index) {
                var coin = cryptoCoinsList[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CoinImage(image: coin.image),
                  title: Text(
                    coin.shortName.toUpperCase(),
                    style: theme.textTheme.bodyText2,
                  ),
                  subtitle: Text(coin.name),
                  onTap: () => Navigator.pushNamed(
                      context, PageRoutes.addTransactionPage,
                      arguments: coin),
                );
              },
            ),
          ),
        ],
      ),
      isBgColored: false,
      secondChildPadding: EdgeInsets.fromLTRB(20, 28, 20, 0),
    );
  }
}
