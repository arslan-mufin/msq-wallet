// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Market`
  String get market {
    return Intl.message(
      'Market',
      name: 'market',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get portfolio {
    return Intl.message(
      'Portfolio',
      name: 'portfolio',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `profit`
  String get profit {
    return Intl.message(
      'profit',
      name: 'profit',
      desc: '',
      args: [],
    );
  }

  /// `Top Volume`
  String get top_volume {
    return Intl.message(
      'Top Volume',
      name: 'top_volume',
      desc: '',
      args: [],
    );
  }

  /// `Top Mover`
  String get top_mover {
    return Intl.message(
      'Top Mover',
      name: 'top_mover',
      desc: '',
      args: [],
    );
  }

  /// `Search coin`
  String get search_coin {
    return Intl.message(
      'Search coin',
      name: 'search_coin',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get select_country {
    return Intl.message(
      'Select Country',
      name: 'select_country',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue With`
  String get or_continue_with {
    return Intl.message(
      'Or Continue With',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `We will send confirmation code on above given number to verify your account.`
  String get we_will_send {
    return Intl.message(
      'We will send confirmation code on above given number to verify your account.',
      name: 'we_will_send',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification code sent on your given number.`
  String get enter_verification_code {
    return Intl.message(
      'Enter Verification code sent on your given number.',
      name: 'enter_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enter_code {
    return Intl.message(
      'Enter Code',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get recent_searches {
    return Intl.message(
      'Recent Searches',
      name: 'recent_searches',
      desc: '',
      args: [],
    );
  }

  /// `Popular Cryptos`
  String get popular_cryptos {
    return Intl.message(
      'Popular Cryptos',
      name: 'popular_cryptos',
      desc: '',
      args: [],
    );
  }

  /// `Add coin`
  String get add_coin {
    return Intl.message(
      'Add coin',
      name: 'add_coin',
      desc: '',
      args: [],
    );
  }

  /// `Create New Portfolio`
  String get create_new_portfolio {
    return Intl.message(
      'Create New Portfolio',
      name: 'create_new_portfolio',
      desc: '',
      args: [],
    );
  }

  /// `Coins`
  String get coins {
    return Intl.message(
      'Coins',
      name: 'coins',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Holdings`
  String get holdings {
    return Intl.message(
      'Holdings',
      name: 'holdings',
      desc: '',
      args: [],
    );
  }

  /// `Create Portfolio`
  String get create_portfolio {
    return Intl.message(
      'Create Portfolio',
      name: 'create_portfolio',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio Name`
  String get portfolio_name {
    return Intl.message(
      'Portfolio Name',
      name: 'portfolio_name',
      desc: '',
      args: [],
    );
  }

  /// `When Lambo? Milwaukee shop wants to detail your supercar for Bitcoin`
  String get news1 {
    return Intl.message(
      'When Lambo? Milwaukee shop wants to detail your supercar for Bitcoin',
      name: 'news1',
      desc: '',
      args: [],
    );
  }

  /// `With this development, could XRPL compete with Ethereum?`
  String get news2 {
    return Intl.message(
      'With this development, could XRPL compete with Ethereum?',
      name: 'news2',
      desc: '',
      args: [],
    );
  }

  /// `How Scallop intends to Take on The Global Banking Industry`
  String get news3 {
    return Intl.message(
      'How Scallop intends to Take on The Global Banking Industry',
      name: 'news3',
      desc: '',
      args: [],
    );
  }

  /// `Connecting Polygon to the Multi-Chain World via Hop Protocol With $200,000.`
  String get news4 {
    return Intl.message(
      'Connecting Polygon to the Multi-Chain World via Hop Protocol With \$200,000.',
      name: 'news4',
      desc: '',
      args: [],
    );
  }

  /// `FBI Seizes 63.7 Bitcoin Allegedly Tied To Colonial Pipeline Hack Ransom`
  String get news5 {
    return Intl.message(
      'FBI Seizes 63.7 Bitcoin Allegedly Tied To Colonial Pipeline Hack Ransom',
      name: 'news5',
      desc: '',
      args: [],
    );
  }

  /// `British Asset Manager Ruffer Bags $1.1 Billion Profit From Bitcoin`
  String get news6 {
    return Intl.message(
      'British Asset Manager Ruffer Bags \$1.1 Billion Profit From Bitcoin',
      name: 'news6',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get my_profile {
    return Intl.message(
      'My Profile',
      name: 'my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Price Alerts`
  String get price_alerts {
    return Intl.message(
      'Price Alerts',
      name: 'price_alerts',
      desc: '',
      args: [],
    );
  }

  /// `App Preferences`
  String get app_preferences {
    return Intl.message(
      'App Preferences',
      name: 'app_preferences',
      desc: '',
      args: [],
    );
  }

  /// `Currency Preference`
  String get currency_preference {
    return Intl.message(
      'Currency Preference',
      name: 'currency_preference',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get tnc {
    return Intl.message(
      'Terms & Condition',
      name: 'tnc',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get app_language {
    return Intl.message(
      'App Language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message(
      'My Account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `Let us know your queries and feedbacks`
  String get let_us_know {
    return Intl.message(
      'Let us know your queries and feedbacks',
      name: 'let_us_know',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Add Price Alert`
  String get add_price_alert {
    return Intl.message(
      'Add Price Alert',
      name: 'add_price_alert',
      desc: '',
      args: [],
    );
  }

  /// `Alert me when`
  String get alert_me_when {
    return Intl.message(
      'Alert me when',
      name: 'alert_me_when',
      desc: '',
      args: [],
    );
  }

  /// `When the price hits the target price, app will send notification alert.`
  String get when_the_price {
    return Intl.message(
      'When the price hits the target price, app will send notification alert.',
      name: 'when_the_price',
      desc: '',
      args: [],
    );
  }

  /// `Alert once`
  String get alert_once {
    return Intl.message(
      'Alert once',
      name: 'alert_once',
      desc: '',
      args: [],
    );
  }

  /// `Recurring`
  String get recurring {
    return Intl.message(
      'Recurring',
      name: 'recurring',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Price Alert`
  String get price_alert {
    return Intl.message(
      'Price Alert',
      name: 'price_alert',
      desc: '',
      args: [],
    );
  }

  /// `Market Cap Rank`
  String get market_cap_rank {
    return Intl.message(
      'Market Cap Rank',
      name: 'market_cap_rank',
      desc: '',
      args: [],
    );
  }

  /// `Market Cap`
  String get market_cap {
    return Intl.message(
      'Market Cap',
      name: 'market_cap',
      desc: '',
      args: [],
    );
  }

  /// `Fully Diluted Valuation`
  String get fully_dil_val {
    return Intl.message(
      'Fully Diluted Valuation',
      name: 'fully_dil_val',
      desc: '',
      args: [],
    );
  }

  /// `Trading Volume`
  String get trading_vol {
    return Intl.message(
      'Trading Volume',
      name: 'trading_vol',
      desc: '',
      args: [],
    );
  }

  /// `24H High`
  String get h_high {
    return Intl.message(
      '24H High',
      name: 'h_high',
      desc: '',
      args: [],
    );
  }

  /// `Your Portfolio is Empty.`
  String get your_portfolio_is_empty {
    return Intl.message(
      'Your Portfolio is Empty.',
      name: 'your_portfolio_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Add a coin to get started.`
  String get add_a_coin_to_get_started {
    return Intl.message(
      'Add a coin to get started.',
      name: 'add_a_coin_to_get_started',
      desc: '',
      args: [],
    );
  }

  /// `Add Transaction`
  String get add_transaction {
    return Intl.message(
      'Add Transaction',
      name: 'add_transaction',
      desc: '',
      args: [],
    );
  }

  /// `Amount of coins`
  String get amount_of_coins {
    return Intl.message(
      'Amount of coins',
      name: 'amount_of_coins',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Buying Price`
  String get buying_price {
    return Intl.message(
      'Buying Price',
      name: 'buying_price',
      desc: '',
      args: [],
    );
  }

  /// `Bought on`
  String get bought_on {
    return Intl.message(
      'Bought on',
      name: 'bought_on',
      desc: '',
      args: [],
    );
  }

  /// `Select Portfolio`
  String get select_portfolio {
    return Intl.message(
      'Select Portfolio',
      name: 'select_portfolio',
      desc: '',
      args: [],
    );
  }

  /// `Your message`
  String get your_message {
    return Intl.message(
      'Your message',
      name: 'your_message',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message`
  String get enter_your_message {
    return Intl.message(
      'Enter your message',
      name: 'enter_your_message',
      desc: '',
      args: [],
    );
  }

  /// `Global Market Cap`
  String get global_market_cap {
    return Intl.message(
      'Global Market Cap',
      name: 'global_market_cap',
      desc: '',
      args: [],
    );
  }

  /// `Cryptocurrency`
  String get cryptocurrency {
    return Intl.message(
      'Cryptocurrency',
      name: 'cryptocurrency',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Exchanges`
  String get exchanges {
    return Intl.message(
      'Exchanges',
      name: 'exchanges',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Chart`
  String get chart {
    return Intl.message(
      'Chart',
      name: 'chart',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get jobs {
    return Intl.message(
      'Jobs',
      name: 'jobs',
      desc: '',
      args: [],
    );
  }

  /// `Sharing Economy`
  String get sharing_economy {
    return Intl.message(
      'Sharing Economy',
      name: 'sharing_economy',
      desc: '',
      args: [],
    );
  }

  /// `Derivative`
  String get derivative {
    return Intl.message(
      'Derivative',
      name: 'derivative',
      desc: '',
      args: [],
    );
  }

  /// `Polka Foundry Red Kite`
  String get polka {
    return Intl.message(
      'Polka Foundry Red Kite',
      name: 'polka',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get sell {
    return Intl.message(
      'Sell',
      name: 'sell',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transfer {
    return Intl.message(
      'Transfer',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `Selling Price`
  String get selling_price {
    return Intl.message(
      'Selling Price',
      name: 'selling_price',
      desc: '',
      args: [],
    );
  }

  /// `Token Wallet`
  String get token_wallet {
    return Intl.message(
      'Token Wallet',
      name: 'token_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Token wallets`
  String get token_wallets {
    return Intl.message(
      'Token wallets',
      name: 'token_wallets',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get add_address {
    return Intl.message(
      'Add Address',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }

  /// `Tokens Watchlist`
  String get tokens_watchlist {
    return Intl.message(
      'Tokens Watchlist',
      name: 'tokens_watchlist',
      desc: '',
      args: [],
    );
  }

  /// `No Tokens in Watchlist`
  String get no_token {
    return Intl.message(
      'No Tokens in Watchlist',
      name: 'no_token',
      desc: '',
      args: [],
    );
  }

  /// `Add address to add in watchlist`
  String get add_address_to_add {
    return Intl.message(
      'Add address to add in watchlist',
      name: 'add_address_to_add',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get value {
    return Intl.message(
      'Value',
      name: 'value',
      desc: '',
      args: [],
    );
  }

  /// `Enter or Paste Address`
  String get enter_or_paste_address {
    return Intl.message(
      'Enter or Paste Address',
      name: 'enter_or_paste_address',
      desc: '',
      args: [],
    );
  }

  /// `Paste`
  String get paste {
    return Intl.message(
      'Paste',
      name: 'paste',
      desc: '',
      args: [],
    );
  }

  /// `Add to watch list`
  String get add_to_watchlist {
    return Intl.message(
      'Add to watch list',
      name: 'add_to_watchlist',
      desc: '',
      args: [],
    );
  }

  /// `Nft`
  String get nft {
    return Intl.message(
      'Nft',
      name: 'nft',
      desc: '',
      args: [],
    );
  }

  /// `Add NFT`
  String get add_nft {
    return Intl.message(
      'Add NFT',
      name: 'add_nft',
      desc: '',
      args: [],
    );
  }

  /// `NFT Watchlist`
  String get nft_watchlist {
    return Intl.message(
      'NFT Watchlist',
      name: 'nft_watchlist',
      desc: '',
      args: [],
    );
  }

  /// `No NFT in Watchlist`
  String get no_nft_in_watchlist {
    return Intl.message(
      'No NFT in Watchlist',
      name: 'no_nft_in_watchlist',
      desc: '',
      args: [],
    );
  }

  /// `Oriental`
  String get oriental {
    return Intl.message(
      'Oriental',
      name: 'oriental',
      desc: '',
      args: [],
    );
  }

  /// `Regional`
  String get regional {
    return Intl.message(
      'Regional',
      name: 'regional',
      desc: '',
      args: [],
    );
  }

  /// `Outlaws`
  String get outlaws {
    return Intl.message(
      'Outlaws',
      name: 'outlaws',
      desc: '',
      args: [],
    );
  }

  /// `Mask`
  String get mask {
    return Intl.message(
      'Mask',
      name: 'mask',
      desc: '',
      args: [],
    );
  }

  /// `Attributes`
  String get attributes {
    return Intl.message(
      'Attributes',
      name: 'attributes',
      desc: '',
      args: [],
    );
  }

  /// `Body Type`
  String get body_type {
    return Intl.message(
      'Body Type',
      name: 'body_type',
      desc: '',
      args: [],
    );
  }

  /// `Environment`
  String get environment {
    return Intl.message(
      'Environment',
      name: 'environment',
      desc: '',
      args: [],
    );
  }

  /// `Head Type`
  String get head_type {
    return Intl.message(
      'Head Type',
      name: 'head_type',
      desc: '',
      args: [],
    );
  }

  /// `Lower Pow`
  String get lower_pow {
    return Intl.message(
      'Lower Pow',
      name: 'lower_pow',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Trust`
  String get trust {
    return Intl.message(
      'Trust',
      name: 'trust',
      desc: '',
      args: [],
    );
  }

  /// `Year of establishment`
  String get year_of_establishment {
    return Intl.message(
      'Year of establishment',
      name: 'year_of_establishment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
