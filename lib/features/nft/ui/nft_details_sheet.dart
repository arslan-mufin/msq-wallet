import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/nft_data.dart';
import 'package:flutter/material.dart';

class NftDetailsSheet extends StatelessWidget {
  final Nft nft;

  NftDetailsSheet(this.nft);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image.asset(
            "assets/nft/nft_result.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nft.name,
                  style: theme.textTheme.headline5,
                ),
                Text(
                  nft.clubName.toUpperCase(),
                  style: theme.textTheme.caption,
                ),
                SizedBox(height: 20),
                Text(
                  s.attributes,
                  style:
                      theme.textTheme.caption!.copyWith(color: theme.hintColor),
                ),
                attributeRow(context, s.body_type, nft.bodyType),
                attributeRow(context, s.environment, nft.environment),
                attributeRow(context, s.head_type, nft.headType),
                attributeRow(context, s.lower_pow, nft.lowerPow),
                SizedBox(height: 20),
                Text(
                  s.about + " " + nft.name,
                  style:
                      theme.textTheme.caption!.copyWith(color: theme.hintColor),
                ),
                SizedBox(height: 4),
                Text(
                  nft.description,
                  style: theme.textTheme.caption!
                      .copyWith(color: theme.textSelectionTheme.cursorColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding attributeRow(
      BuildContext context, String attributeType, String value) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            attributeType.toUpperCase(),
            style: Theme.of(context).textTheme.caption,
          ),
          Text(value),
        ],
      ),
    );
  }
}
