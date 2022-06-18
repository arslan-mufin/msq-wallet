import 'package:cryptox/app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_data_layer.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale(AppConfig.defaultLanguage));

  void selectLanguage(String langCode) => emit(Locale(langCode));

  void getCurrentLanguage() async {
    String langCode = await LocalDataLayer().getCurrentLanguage();
    selectLanguage(langCode);
  }

  Future<void> setCurrentLanguage(String langCode) async {
    await LocalDataLayer().setCurrentLanguage(langCode);
    selectLanguage(langCode);
  }
}
