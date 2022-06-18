import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final List<String> _recentSearches = [
    "Link",
    "Bitcoin",
    "ETH",
    "Dogecoin",
    "BNB",
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(s.search, style: theme.textTheme.headline5),
        centerTitle: false,
      ),
      firstChild: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: theme.disabledColor),
          hintText: s.search_coin,
          hintStyle:
              theme.textTheme.subtitle1!.copyWith(color: theme.disabledColor),
        ),
      ),
      secondChild: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            s.recent_searches,
            style:
                theme.textTheme.subtitle1!.copyWith(color: theme.disabledColor),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 20, bottom: 28),
            physics: NeverScrollableScrollPhysics(),
            itemCount: _recentSearches.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(_recentSearches[index]),
            ),
          ),
          Text(
            s.popular_cryptos,
            style:
                theme.textTheme.subtitle1!.copyWith(color: theme.disabledColor),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 8),
            physics: NeverScrollableScrollPhysics(),
            itemCount: cryptoCoinsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var coin = cryptoCoinsList[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CoinImage(image: coin.image),
                title: Text(
                  coin.shortName.toUpperCase(),
                  style: theme.textTheme.bodyText2,
                ),
                subtitle: Text(coin.name, style: theme.textTheme.caption),
              );
            },
          ),
        ],
      ),
      isBgColored: false,
      secondChildPadding: EdgeInsets.fromLTRB(20, 30, 20, 0),
    );
  }
}
