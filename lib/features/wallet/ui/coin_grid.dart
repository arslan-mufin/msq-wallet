import 'package:cryptox/components/coin_image.dart';
import 'package:cryptox/models/coin_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';

class TokenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: coins.length,
        itemBuilder: (context, index) {
          var coin = coins[index];
          return Card(
            margin: EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CoinImage(image: coin.icon),
              title: Text(coin.shortName.toUpperCase()),
              subtitle: Text(
                coin.name,
                style: Theme.of(context).textTheme.caption,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => Navigator.pushNamed(
                context,
                PageRoutes.tokenPage,
                arguments: coin,
              ),
            ),
          );
        },
      ),
    );
  }
}
