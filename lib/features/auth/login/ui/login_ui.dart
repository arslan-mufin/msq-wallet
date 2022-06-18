part of 'login_page.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  late TextEditingController _numberController;

  String? isoCode = "US";
  String dialCode = "+1";

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(text: dialCode);
    showLanguageSheet();
  }

  showLanguageSheet() {
    Future.delayed(
      Duration(milliseconds: 100),
      () async {
        await showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          builder: (context) => LanguageSheet(),
        );
      },
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return CustomScaffold(
      appBar: null,
      firstChild: null,
      secondChild: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height * 0.65 - AppBar().preferredSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text(
                S.of(context).select_country,
                style: theme.textTheme.caption,
              ),
              CountryCodePicker(
                dialogTextStyle: theme.textTheme.bodyText1,
                textStyle: theme.textTheme.subtitle1,
                onChanged: (value) {
                  isoCode = value.code;
                  dialCode = value.dialCode!;
                  _numberController.text = dialCode;
                },
                padding: EdgeInsets.zero,
                alignLeft: true,
                dialogBackgroundColor: theme.scaffoldBackgroundColor,
                dialogSize: Size(size.width * 0.8, size.height * 0.8),
                initialSelection: 'US',
                favorite: ['+91', 'US'],
                showOnlyCountryWhenClosed: true,
                showDropDownButton: true,
                showFlag: false,
              ),
              Divider(height: 0),
              Spacer(),
              CustomTextField(
                controller: _numberController,
                label: S.of(context).phone_number,
                hint: S.of(context).phone_number,
                keyboardType: TextInputType.number,
              ),
              Spacer(),
              Buttons.customButton(
                context,
                onTap: () {
                  widget.loginInteractor.loginWithMobile(
                    isoCode!,
                    _numberController.text,
                  );
                },
              ),
              Spacer(),
              Text(
                S.of(context).or_continue_with,
                textAlign: TextAlign.center,
                style: theme.textTheme.caption,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Buttons.customButton(
                      context,
                      onTap: () => widget.loginInteractor.loginWithFacebook(),
                      image: Assets.fbIcon,
                      text: "facebook",
                      isBgColored: false,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Buttons.customButton(
                      context,
                      onTap: () => widget.loginInteractor.loginWithGoogle(),
                      image: Assets.googleIcon,
                      text: "google",
                      isBgColored: false,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
      upperContent: Container(
        height: size.height * 0.4,
        child: Image.asset(
          themeData == AppTheme.darkTheme ? Assets.appLogo : Assets.darkAppLogo,
        ),
      ),
    );
  }
}
