import 'package:country_code_picker/country_localizations.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/logic/bloc_delegate.dart';
import 'package:cryptox/logic/language_cubit.dart';
import 'package:cryptox/logic/theme_cubit.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app_config/app_config.dart';
import 'features/auth/login_navigator.dart';
import 'logic/variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocDelegate();
  MobileAds.instance.initialize();
  runApp(
    Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LanguageCubit()..getCurrentLanguage()),
          BlocProvider(create: (context) => ThemeCubit()..getCurrentTheme()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        selectedLangCode = locale.languageCode;
        language = AppConfig.languagesSupported[selectedLangCode];
        return BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            themeData = theme;
            return MaterialApp(
              localizationsDelegates: [
                S.delegate,
                CountryLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: locale,
              theme: theme,
              home: LoginNavigator(),
              routes: PageRoutes.routes(),
            );
          },
        );
      },
    );
  }
}
