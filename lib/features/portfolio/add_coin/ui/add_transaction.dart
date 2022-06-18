import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/features/portfolio/add_coin/ui/buy_tab.dart';
import 'package:cryptox/features/portfolio/add_coin/ui/sell_tab.dart';
import 'package:cryptox/features/portfolio/add_coin/ui/transfer_tab.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  late CryptoCoin coin;
  late ThemeData theme;
  late S s;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    s = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    coin = ModalRoute.of(context)!.settings.arguments as CryptoCoin;
    return DefaultTabController(
      length: 3,
      child: CustomScaffold(
        appBar: _appBar,
        firstChild: _firstChild,
        secondChild: _secondChild,
        isBgColored: false,
        secondChildPadding: EdgeInsetsDirectional.only(top: 28, start: 30),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: Text(
        s.add_transaction.toUpperCase(),
        style: Theme.of(context).textTheme.subtitle1,
      ),
      actions: [
        Row(
          children: [
            Image.asset(coin.image),
            SizedBox(width: 8),
            Text(
              coin.shortName.toUpperCase(),
              style: theme.textTheme.caption,
            ),
            SizedBox(width: 16),
          ],
        )
      ],
    );
  }

  Widget get _firstChild {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          indicatorPadding: EdgeInsetsDirectional.only(end: 8),
          indicatorColor: theme.primaryColor,
          unselectedLabelStyle: theme.primaryTextTheme.bodyText1,
          labelStyle: theme.primaryTextTheme.bodyText1!
              .copyWith(fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: s.buy),
            Tab(text: s.sell),
            Tab(text: s.transfer),
          ],
        ),
      ),
    );
  }

  Widget get _secondChild {
    return TabBarView(
      physics: BouncingScrollPhysics(),
      children: [
        BuyTab(),
        SellTab(),
        TransferTab(),
      ],
    );
  }
}
