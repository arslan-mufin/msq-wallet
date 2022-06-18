import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTnc = ModalRoute.of(context)!.settings.arguments as bool;
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          (isTnc ? s.tnc : s.privacy_policy).toUpperCase(),
          style: theme.textTheme.subtitle1,
        ),
      ),
      firstChild: null,
      secondChild: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing "
            "elit. Cras rhoncus nulla nec nisl lacinia "
            "posuere. Maecenas quis nunc sapien. Vivamus "
            "sed ante ac risus tincidunt porttitor. Vivamus "
            "ut massa eu orci faucibus faucibus. Proin "
            "imperdiet urna vel neque tincidunt, ac varius "
            "elit accumsan. Pellentesque nec hendrerit "
            "metus, eu iaculis diam. Lorem ipsum dolor sit "
            "amet, consectetur adipiscing elit. Ut est "
            "tellus, imperdiet sit amet volutpat sit amet, "
            "faucibus efficitur metus. In velit nunc, "
            "fringilla ut euismod a, dictum a lectus. "
            "Integer vel lacus mauris. Ut finibus, augue "
            "nec efficitur laoreet, tellus ante ultrices "
            "libero, consequat iaculis nulla ligula vitae "
            "est. Donec non pretium turpis. Ut non mattis "
            "felis. Duis vulputate ligula non finibus "
            "ultrices. Suspendisse justo sapien, maximus et "
            "dignissim eu, pretium euismod sapien. \n\nNullam "
            "at efficitur ligula. Praesent ipsum sapien, "
            "malesuada sed leo eget, mollis lobortis arcu. "
            "Ut quam ligula, commodo sit amet interdum ut, "
            "faucibus at tellus. Sed ac lacus ac lacus "
            "sollicitudin posuere. Quisque nec tortor "
            "maximus, euismod lectus non, vestibulum "
            "turpis. Sed quis enim eu quam suscipit lacinia "
            "in in risus. Morbi fermentum a lorem vitae "
            "sollicitudin. Fusce faucibus consectetur "
            "libero ac suscipit. Praesent euismod ultrices "
            "sollicitudin. Etiam id congue leo.",
            style: theme.textTheme.bodyText2!.copyWith(height: 1.7),
          ),
          SizedBox(height: 16),
          Text(
            isTnc ? s.tnc : s.privacy_policy,
            style: theme.textTheme.caption,
          ),
          SizedBox(height: 16),
          Text(
            "Ut est tellus, imperdiet sit amet volutpat sit amet, faucibus "
            "efficitur metus. In velit nunc, fringilla ut euismod a, dictum a lectus. ",
            style: theme.textTheme.bodyText2!.copyWith(height: 1.7),
          ),
        ],
      ),
      secondChildPadding: EdgeInsets.fromLTRB(20, 30, 20, 0),
    );
  }
}
