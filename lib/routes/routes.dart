import 'package:cryptox/features/account/ui/account_page.dart';
import 'package:cryptox/features/account/ui/contact_us_page.dart';
import 'package:cryptox/features/account/ui/terms_page.dart';
import 'package:cryptox/features/app_navigation/app_navigation.dart';
import 'package:cryptox/features/coin_details/ui/coin_details_page.dart';
import 'package:cryptox/features/market/categories/ui/category_tab_options.dart';
import 'package:cryptox/features/market/exchanges/exchanges_tab_options.dart';
import 'package:cryptox/features/my_account/ui/my_account_page.dart';
import 'package:cryptox/features/news/ui/read_news_page.dart';
import 'package:cryptox/features/portfolio/add_coin/ui/add_coin_page.dart';
import 'package:cryptox/features/portfolio/add_coin/ui/add_transaction.dart';
import 'package:cryptox/features/portfolio/ui/create_portfolio_page.dart';
import 'package:cryptox/features/price_alert/ui/add_price_alert_page.dart';
import 'package:cryptox/features/price_alert/ui/price_alerts_page.dart';
import 'package:cryptox/features/search/ui/search_page.dart';
import 'package:cryptox/features/wallet/ui/add_address_page.dart';
import 'package:cryptox/features/wallet/ui/token_page.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String appNavigation = "app_navigation";
  static const String searchPage = "search_page";
  static const String accountPage = "account_page";
  static const String createPortfolioPage = "create_portfolio_page";
  static const String addCoinPage = "add_coin_page";
  static const String readNewsPage = "read_news_page";
  static const String myAccountPage = "my_account_page";
  static const String priceAlertPage = "price_alert_page";
  static const String termsPage = "terms_page";
  static const String contactUsPage = "contact_us_page";
  static const String coinDetailsPage = "coin_details_page";
  static const String addPriceAlertPage = "add_price_alert_page";
  static const String addTransactionPage = "add_transaction_page";
  static const String tokenPage = "token_page";
  static const String addAddressPage = "add_address_page";
  static const String categoryTabOptions = "category_tab_options";
  static const String exchangesTabOptions = "exchanges_tab_options";

  static Map<String, WidgetBuilder> routes() {
    return {
      appNavigation: (context) => AppNavigation(),
      searchPage: (context) => SearchPage(),
      accountPage: (context) => AccountPage(),
      createPortfolioPage: (context) => CreatePortfolioPage(),
      addCoinPage: (context) => AddCoinPage(),
      readNewsPage: (context) => ReadNewsPage(),
      myAccountPage: (context) => MyAccountPage(),
      priceAlertPage: (context) => PriceAlertPage(),
      termsPage: (context) => TermsPage(),
      contactUsPage: (context) => ContactUsPage(),
      coinDetailsPage: (context) => CoinDetailsPage(),
      addPriceAlertPage: (context) => AddPriceAlertPage(),
      addTransactionPage: (context) => AddTransactionPage(),
      tokenPage: (context) => TokenPage(),
      addAddressPage: (context) => AddAddressPage(),
      categoryTabOptions: (context) => CategoriesTabOptions(),
      exchangesTabOptions: (context) => ExchangesTabOptions(),
    };
  }
}
