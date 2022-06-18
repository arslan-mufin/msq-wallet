import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cryptox/components/curved_image.dart';
import 'package:cryptox/features/nft/ui/nft_details_sheet.dart';
import 'package:cryptox/models/nft_data.dart';
import 'package:flutter/material.dart';

class NftGrid extends StatelessWidget {
  final List<Nft> nftList;

  NftGrid(this.nftList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 80),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: nftList.length,
        itemBuilder: (context, index) {
          var nft = nftList[index];
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                backgroundColor: Theme.of(context).backgroundColor,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.885,
                  child: NftDetailsSheet(nft),
                ),
              );
            },
            child: FadedScaleAnimation(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CurvedImage(nft.image),
                  SizedBox(height: 8),
                  Text(
                    nft.name + " #${nft.number}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
