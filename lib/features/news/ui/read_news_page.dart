import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/models/news_data.dart';
import 'package:flutter/material.dart';

class ReadNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsData news = ModalRoute.of(context)!.settings.arguments as NewsData;
    return Scaffold(
      body: Stack(
        children: [
          FadedScaleAnimation(
            child: Image.asset(
              Assets.newsHeader,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.44,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.28),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                      physics: BouncingScrollPhysics(),
                      children: [
                        Text(
                          news.news,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "\n" + news.user + "  ·  " + news.createdAt + "\n",
                          style: Theme.of(context).textTheme.caption,
                        ),
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
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
