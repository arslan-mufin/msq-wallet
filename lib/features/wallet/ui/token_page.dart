import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/features/wallet/ui/token_watchlist.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/coin_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TokenPage extends StatefulWidget {
  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  bool _showList = false;

  @override
  Widget build(BuildContext context) {
    var coin = ModalRoute.of(context)!.settings.arguments as Coin;
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(coin.icon),
            SizedBox(width: 8),
            Text(
              coin.name + " (" + coin.shortName + ")",
              style: theme.textTheme.bodyText2!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 24),
          ],
        ),
        centerTitle: true,
      ),
      firstChild: ListTile(
        leading: Icon(Icons.add_circle),
        title: Text(s.add_address),
        onTap: () =>
            Navigator.pushNamed(context, PageRoutes.addAddressPage).then(
          (value) => setState(() => _showList = true),
        ),
      ),
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.tokens_watchlist,
            style:
                theme.textTheme.bodyText2!.copyWith(color: theme.dividerColor),
          ),
          SizedBox(height: 20),
          TokensWatchlist(_showList),
        ],
      ),
    );
  }
}
