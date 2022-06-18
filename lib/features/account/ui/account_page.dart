import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/components/currency_drop_down_button.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/features/account/ui/language_sheet.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/logic/theme_cubit.dart';
import 'package:cryptox/logic/variables.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late bool isDark;
  late ThemeCubit _themeCubit;
  String selectedCurrency = "USD";

  @override
  void initState() {
    super.initState();
    _themeCubit = BlocProvider.of<ThemeCubit>(context)..getCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(s.account.toUpperCase(), style: theme.textTheme.subtitle1),
      ),
      firstChild: null,
      secondChild: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(s.my_profile),
            onTap: () => Navigator.pushNamed(context, PageRoutes.myAccountPage),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(s.price_alerts),
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.priceAlertPage),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              s.app_preferences,
              style: theme.textTheme.caption,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(s.currency_preference),
            trailing: CurrencyDropDownButton(
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value as String;
                });
              },
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, currentTheme) {
              isDark = currentTheme == AppTheme.darkTheme;
              return SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(s.dark_mode),
                onChanged: (bool value) async {
                  String theme = value ? "dark" : "light";
                  await _themeCubit.setCurrentTheme(theme);
                },
                value: isDark,
                activeTrackColor: theme.scaffoldBackgroundColor,
                inactiveTrackColor: theme.scaffoldBackgroundColor,
                activeColor: theme.primaryColor,
                inactiveThumbColor: theme.primaryColor.withOpacity(0.5),
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(S.of(context).app_language),
            trailing: Text(language!, style: theme.textTheme.caption),
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isDismissible: false,
                builder: (context) => LanguageSheet(),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              s.other,
              style: theme.textTheme.caption,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(s.privacy_policy),
            onTap: () => Navigator.pushNamed(context, PageRoutes.termsPage,
                arguments: false),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(s.tnc),
            onTap: () => Navigator.pushNamed(context, PageRoutes.termsPage,
                arguments: true),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(s.contact_us),
            onTap: () => Navigator.pushNamed(context, PageRoutes.contactUsPage),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              s.logout,
              style: theme.textTheme.subtitle1!
                  .copyWith(color: theme.primaryColorLight),
            ),
            onTap: () => Phoenix.rebirth(context),
          ),
        ],
      ),
    );
  }
}
