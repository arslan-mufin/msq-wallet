import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/features/market/categories/ui/categories_tab.dart';
import 'package:cryptox/features/market/cryptocurrency/ui/cryptocurrency_tab.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/logic/variables.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';

import 'exchanges/ui/exchanges_tab.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CustomScaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: _appBar,
        firstChild: null,
        secondChild: _secondChild,
        upperContent: _upperContent,
        secondChildPadding: EdgeInsets.zero,
      ),
    );
  }

  AppBar get _appBar {
    var theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.cardColor,
      leading: IconButton(
        icon: Icon(Icons.search),
        color: theme.disabledColor,
        onPressed: () => Navigator.pushNamed(context, PageRoutes.searchPage),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.appIcon),
          SizedBox(width: 8),
          Image.asset(
            Assets.headLogo,
            color:
                themeData == AppTheme.darkTheme ? Colors.white : Colors.black,
          ),
        ],
      ),
      centerTitle: true,
      textTheme: theme.appBarTheme.textTheme,
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          color: theme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 16),
          onPressed: () => Navigator.pushNamed(context, PageRoutes.accountPage),
        ),
      ],
    );
  }

  Widget get _upperContent {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: TabBar(
        indicatorColor: theme.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle: theme.primaryTextTheme.bodyText1,
        labelStyle: theme.primaryTextTheme.bodyText1!
            .copyWith(fontWeight: FontWeight.bold),
        indicatorPadding: EdgeInsetsDirectional.only(end: 48),
        tabs: [
          Tab(text: s.cryptocurrency),
          Tab(text: s.categories),
          Tab(text: s.exchanges),
        ],
      ),
    );
  }

  Widget get _secondChild {
    return TabBarView(
      physics: BouncingScrollPhysics(),
      children: [
        CryptocurrencyTab(),
        CategoriesTab(),
        ExchangeTab(),
      ],
    );
  }
}
