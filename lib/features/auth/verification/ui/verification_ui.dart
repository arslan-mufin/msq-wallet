part of 'verification_page.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  VerificationUI(this.verificationInteractor);

  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).verification.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: null,
      secondChild: Column(
        children: [
          Text(
            S.of(context).enter_verification_code,
            textAlign: TextAlign.center,
            style: theme.textTheme.caption!
                .copyWith(color: theme.textSelectionTheme.cursorColor),
          ),
          Spacer(),
          CustomTextField(
            label: S.of(context).enter_code,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Spacer(),
          Buttons.customButton(context, onTap: () {
            widget.verificationInteractor.verify();
          }),
          Spacer(flex: 10),
        ],
      ),
    );
  }
}
