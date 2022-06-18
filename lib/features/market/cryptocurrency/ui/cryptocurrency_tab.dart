import 'package:cryptox/app_config/app_config.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'coin_table.dart';

class CryptocurrencyTab extends StatefulWidget {
  @override
  _CryptocurrencyTabState createState() => _CryptocurrencyTabState();
}

class _CryptocurrencyTabState extends State<CryptocurrencyTab> {
  bool showFavourite = false;
  bool isUsd = true;
  String coinToShowValue = "All";
  String? marketCap;

  List<String> coinsToShow = [
    "All",
    "Top 100",
    "Top 300",
    "Stable Coin",
    "Exchange based coins",
    "Governance",
    "Meme Tokens",
    "Oracle",
  ];

  List<String> marketCaps = [
    "Largest Market Cap",
    "Lowest Market Cap",
    "Highest Ranking",
    "Lowest Ranking",
    "Last Added",
  ];

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: AppConfig.admobKey,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('BannerAd onAdClosed.'),
      ),
    );

    return banner.load();
  }

  @override
  void dispose() {
    _anchoredBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Builder(
      builder: (context) {
        if (!_loadingAnchoredBanner) {
          _loadingAnchoredBanner = true;
          _createAnchoredBanner(context);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text.rich(
                TextSpan(
                  style: theme.textTheme.caption,
                  children: [
                    TextSpan(text: s.global_market_cap + ": "),
                    TextSpan(
                      text: "\$1,379,533,609,257",
                      style: theme.textTheme.caption!
                          .copyWith(color: theme.primaryColor),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 36,
              child: ListView(
                padding: EdgeInsetsDirectional.only(start: 20),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  ActionChip(
                    label: Text(s.favourite),
                    labelStyle: theme.textTheme.caption!.copyWith(
                        color: showFavourite
                            ? theme.textSelectionTheme.cursorColor
                            : theme.dividerColor),
                    backgroundColor: showFavourite
                        ? theme.primaryColorLight
                        : theme.cardColor,
                    avatar:
                        Icon(Icons.star, size: 16, color: theme.primaryColor),
                    onPressed: () {
                      setState(() {
                        showFavourite = !showFavourite;
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  ActionChip(
                    label: Text(isUsd ? "USD/BTC" : "BTC/USD"),
                    labelStyle: theme.textTheme.caption!
                        .copyWith(color: theme.dividerColor),
                    backgroundColor: theme.cardColor,
                    onPressed: () {
                      setState(() {
                        isUsd = !isUsd;
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  _coinsToShowDropdown(),
                  SizedBox(width: 8),
                  _marketCapDropdown(),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_anchoredBanner != null)
              Container(
                width: _anchoredBanner!.size.width.toDouble(),
                height: _anchoredBanner!.size.height.toDouble(),
                child: AdWidget(ad: _anchoredBanner!),
              ),
            CoinTable(showFavourite),
          ],
        );
      },
    );
  }

  Container _coinsToShowDropdown() {
    var theme = Theme.of(context);
    return Container(
      constraints: BoxConstraints(maxWidth: 100),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: theme.cardColor,
      ),
      child: DropdownButton(
        value: coinToShowValue,
        items: coinsToShow
            .map((e) => DropdownMenuItem(
                  child: Text(e, overflow: TextOverflow.ellipsis),
                  value: e,
                ))
            .toList(),
        underline: Container(),
        iconEnabledColor: theme.primaryColorLight,
        iconSize: 16,
        style: theme.textTheme.caption!.copyWith(color: theme.dividerColor),
        onChanged: (value) {
          setState(() {
            coinToShowValue = value as String;
          });
        },
        isExpanded: true,
        dropdownColor: theme.cardColor,
      ),
    );
  }

  Container _marketCapDropdown() {
    var theme = Theme.of(context);
    return Container(
      constraints: BoxConstraints(maxWidth: 120),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: theme.cardColor,
      ),
      child: DropdownButton(
        value: marketCap,
        hint: Text(
          S.of(context).market_cap,
          style: theme.textTheme.caption!.copyWith(color: theme.dividerColor),
        ),
        items: marketCaps
            .map((e) => DropdownMenuItem(
                  child: Text(e, overflow: TextOverflow.ellipsis),
                  value: e,
                ))
            .toList(),
        underline: Container(),
        iconEnabledColor: theme.primaryColorLight,
        iconSize: 16,
        style: theme.textTheme.caption!.copyWith(color: theme.dividerColor),
        onChanged: (value) {
          setState(() {
            marketCap = value as String;
          });
        },
        isExpanded: true,
        dropdownColor: theme.cardColor,
      ),
    );
  }
}
