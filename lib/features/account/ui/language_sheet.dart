import 'package:cryptox/app_config/app_config.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/logic/language_cubit.dart';
import 'package:cryptox/logic/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSheet extends StatefulWidget {
  @override
  _LanguageSheetState createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late LanguageCubit _languageCubit;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.transparent,
      appBar: null,
      firstChild: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          S.of(context).app_language,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
      secondChild: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, currentLocale) {
          language = AppConfig.languagesSupported[selectedLangCode];
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: AppConfig.languagesSupported.length,
            itemBuilder: (context, index) {
              var langCode = AppConfig.languagesSupported.keys.elementAt(index);
              return RadioListTile(
                title: Text(AppConfig.languagesSupported[langCode]!),
                value: langCode,
                groupValue: selectedLangCode,
                onChanged: (langCode) async {
                  setState(() {
                    selectedLangCode = langCode as String;
                  });
                },
                activeColor: Theme.of(context).primaryColor,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.check),
        onPressed: () async {
          await _languageCubit.setCurrentLanguage(selectedLangCode!);
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
