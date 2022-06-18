part of 'registration_page.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  RegistrationUI(this.registrationInteractor, this.phoneNumber);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).create_account.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      firstChild: null,
      secondChild: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: _nameController,
                  label: S.of(context).full_name,
                  textCapitalization: TextCapitalization.words,
                ),
                CustomTextField(
                  controller: _emailController,
                  label: S.of(context).email_address,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                ),
                CustomTextField(
                  initialValue: widget.phoneNumber,
                  label: S.of(context).phone_number,
                  readOnly: true,
                ),
                SizedBox(height: 120),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 20,
            start: 0,
            end: 0,
            child: Column(
              children: [
                Buttons.customButton(
                  context,
                  onTap: () => widget.registrationInteractor
                      .resister(_nameController.text, _emailController.text),
                ),
                SizedBox(height: 16,),
                Text(
                  S.of(context).we_will_send,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
