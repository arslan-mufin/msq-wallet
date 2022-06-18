import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/components/curved_image.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/components/token_row.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/nft_data.dart';
import 'package:cryptox/models/token_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    List<Nft> nftList = [
      Nft(Assets.nft1, "Bored", 9610, "Bored Ape Kennel Club", s.oriental,
          s.regional, s.outlaws, s.mask),
      Nft(Assets.nft2, "Lucky Maneki", 9151, "Bored Ape Kennel Club",
          s.oriental, s.regional, s.outlaws, s.mask),
      Nft(Assets.nft3, "Lucky Maneki", 9151, "Bored Ape Kennel Club",
          s.oriental, s.regional, s.outlaws, s.mask),
      Nft(Assets.nft4, "Lucky Maneki", 9151, "Bored Ape Kennel Club",
          s.oriental, s.regional, s.outlaws, s.mask),
      Nft(Assets.nft5, "Lucky Maneki", 9151, "Bored Ape Kennel Club",
          s.oriental, s.regional, s.outlaws, s.mask),
      Nft(Assets.nft6, "Lucky Maneki", 9151, "Bored Ape Kennel Club",
          s.oriental, s.regional, s.outlaws, s.mask),
    ];

    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          s.nft.toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: ListTile(
        leading: Icon(Icons.add_circle),
        title: Text(s.add_nft),
        onTap: () => Navigator.pushNamed(context, PageRoutes.addAddressPage,
            arguments: nftList),
      ),
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.nft_watchlist.toUpperCase(),
            style:
                theme.textTheme.bodyText2!.copyWith(color: theme.dividerColor),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: tokens.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.addAddressPage,
                        arguments: nftList.sublist(0, 4));
                  },
                  child: Card(
                    margin: EdgeInsets.only(bottom: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 8),
                      child: Column(
                        children: [
                          TokenRow(tokens[index]),
                          SizedBox(height: 12),
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              itemCount: nftList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.only(end: 8),
                                  child:
                                      CurvedImage(nftList[i].image, radius: 12),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      yellowGradient: true,
      secondChildPadding: EdgeInsets.fromLTRB(20, 30, 20, 0),
    );
  }
}
