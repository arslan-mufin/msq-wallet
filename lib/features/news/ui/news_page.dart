import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/news_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    List<NewsData> newsList = [
      NewsData(Assets.news1, s.news1, "CryptoXrayz", "20m"),
      NewsData(Assets.news2, s.news2, "Bitcoinzilla", "20m"),
      NewsData(Assets.news3, s.news3, "Worldofcoin", "20m"),
      NewsData(Assets.news4, s.news4, "yptoXrayz", "20m"),
      NewsData(Assets.news5, s.news5, "Worldofcoin", "20m"),
      NewsData(Assets.news6, s.news6, "Blackmoney23", "20m"),
      NewsData(Assets.news1, s.news1, "CryptoXrayz", "20m"),
      NewsData(Assets.news2, s.news2, "Bitcoinzilla", "20m"),
      NewsData(Assets.news3, s.news3, "Worldofcoin", "20m"),
    ];
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).news,
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: false,
      ),
      firstChild: null,
      secondChild: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          var news = newsList[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, PageRoutes.readNewsPage,
                  arguments: news),
              child: Container(
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(news.image, height: 80, fit: BoxFit.fill),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.news,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Expanded(
                            child: Text(
                              news.user + "  ·  " + news.createdAt,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      secondChildPadding: EdgeInsets.fromLTRB(20, 30, 20, 0),
    );
  }
}
