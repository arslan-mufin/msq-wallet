import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cryptox/components/buttons.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/custom_text_field.dart';
import 'package:cryptox/features/nft/ui/nft_grid.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/nft_data.dart';
import 'package:cryptox/models/token_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'token_content.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _controller = TextEditingController();

  bool _showCard = false;

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    var nftList = ModalRoute.of(context)!.settings.arguments as List<Nft>?;
    if (nftList != null && nftList.length == 4) {
      _showCard = true;
    }
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          s.add_address.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: CustomTextField(
        controller: _controller,
        padding: EdgeInsets.zero,
        showUnderline: false,
        prefixIcon: Icon(Icons.search, color: theme.disabledColor),
        hint: s.enter_or_paste_address,
      ),
      secondChild: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Buttons.customButton(
                  context,
                  icon: Icons.paste,
                  iconSize: 20,
                  isBgColored: false,
                  isIconGradient: true,
                  text: s.paste,
                  onTap: () async {
                    ClipboardData? data = await Clipboard.getData('text/plain');
                    if (data != null) {
                      _controller.text = data.text!;
                    }
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Buttons.customButton(
                  context,
                  yellowGradient: true,
                  text: s.search,
                  icon: Icons.search,
                  iconSize: 20,
                  onTap: () {
                    setState(() {
                      _showCard = true;
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          if (nftList == null && _showCard)
            FadedScaleAnimation(
              child: Card(
                margin: EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                  child: Column(
                    children: [
                      TokenContent(tokens.first),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Buttons.customButton(
                          context,
                          onTap: () => Navigator.pop(context),
                          text: s.add_to_watchlist,
                          icon: Icons.add_circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (nftList != null && _showCard) NftGrid(nftList),
        ],
      ),
      isBgColored: false,
      floatingActionButton: nftList != null && _showCard
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Buttons.customButton(
                context,
                onTap: () => Navigator.pop(context),
                icon: Icons.add_circle,
                text: s.add_to_watchlist,
              ),
            )
          : null,
    );
  }
}
