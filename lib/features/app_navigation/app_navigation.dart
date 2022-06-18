import 'package:blur/blur.dart';
import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/features/market/market_page.dart';
import 'package:cryptox/features/news/ui/news_page.dart';
import 'package:cryptox/features/nft/ui/nft_page.dart';
import 'package:cryptox/features/portfolio/ui/portfolio_page.dart';
import 'package:cryptox/features/wallet/ui/wallet_page.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  ValueChanged<int>? onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    final List<Widget> _children = [
      MarketPage(),
      PortfolioPage(),
      WalletPage(),
      NftPage(),
      NewsPage(),
    ];
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(Assets.wishlistIcon)),
        label: s.market.toUpperCase(),
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(Assets.portfolioIcon)),
        label: s.portfolio.toUpperCase(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet),
        label: s.wallet.toUpperCase(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.image),
        label: "NFT",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.lightbulb_outline),
        label: s.news.toUpperCase(),
      ),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.disabledColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        elevation: 0,
        onTap: onTap,
      ).frosted(
        frostColor: theme.cardColor,
        blur: 20,
        frostOpacity: 0.8,
      ),
    );
  }
}
