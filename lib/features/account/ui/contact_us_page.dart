import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    var size = MediaQuery.of(context).size;
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          s.contact_us.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: null,
      secondChild: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                // Spacer(),
                SizedBox(height: 20,),
                CustomTextField(
                  initialValue: "Samantha Smith",
                  label: S.of(context).full_name,
                  showUnderline: false,
                ),
                CustomTextField(
                  initialValue: "samanthasmith@mail.com",
                  label: S.of(context).email_address,
                  showUnderline: false,
                ),
                CustomTextField(
                  label: S.of(context).your_message,
                  hint: S.of(context).enter_your_message,
                ),
                SizedBox(height: 120,),
              ],
            ),
          ),
          PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 20,
              child: Buttons.customButton(context, onTap: () {}, text: s.submit)),
        ],
      ),
      upperContent: Container(
        height: size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(Assets.appLogo),
            Text(s.let_us_know, style: theme.textTheme.caption),
          ],
        ),
      ),
    );
  }
}
