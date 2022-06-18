import 'package:cryptox/app_config/app_theme.dart';
import 'package:cryptox/assets/assets.dart';
import 'package:cryptox/components/custom_scaffold.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';

import 'portfolio_coin_row.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with TickerProviderStateMixin {
  bool _arePortfoliosShown = false;
  late String _selectedPortfolio;
  bool _sort = false;

  final List<String> _portfolios = [
    S.current.portfolio + " 1",
    S.current.portfolio + " SafeX"
  ];

  @override
  void initState() {
    super.initState();
    _selectedPortfolio = _portfolios.first;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onSortColumn(_sort);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      appBar: null,
      upperContent: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _arePortfoliosShown = !_arePortfoliosShown;
                  });
                },
                child: Row(
                  children: [
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 350),
                      curve: Curves.fastOutSlowIn,
                      child: Text(
                        _selectedPortfolio,
                        style: theme.textTheme.headline5,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      _arePortfoliosShown
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
              if (_arePortfoliosShown)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    s.select_portfolio,
                    style: theme.textTheme.caption,
                  ),
                ),
              AnimatedSize(
                vsync: this,
                duration: Duration(milliseconds: 350),
                curve: Curves.fastOutSlowIn,
                child: _arePortfoliosShown
                    ? ListView.builder(
                        itemCount: _portfolios.length + 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index == _portfolios.length) {
                            return ListTile(
                              title: Text(
                                s.create_new_portfolio,
                                style: theme.textTheme.subtitle2!
                                    .copyWith(fontSize: 16),
                              ),
                              trailing:
                                  Icon(Icons.add, color: AppTheme.upColor),
                              contentPadding: EdgeInsets.zero,
                              onTap: () => Navigator.pushNamed(
                                  context, PageRoutes.createPortfolioPage),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedPortfolio = _portfolios[index];
                                  _arePortfoliosShown = false;
                                });
                              },
                              child: Text(
                                _portfolios[index],
                                style: theme.textTheme.subtitle1!
                                    .copyWith(height: 2),
                              ),
                            );
                          }
                        },
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
      firstChild: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedPortfolio == _portfolios.first
                      ? "\$101,620.34"
                      : "\$0",
                  style: theme.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  _selectedPortfolio == _portfolios.first
                      ? "+ \$3275.21"
                      : "+ \$0",
                  style: theme.textTheme.subtitle2!
                      .copyWith(color: theme.disabledColor),
                ),
                SizedBox(width: 8),
                Text(
                  _selectedPortfolio == _portfolios.first ? "(15.71%)" : "(0%)",
                  style: theme.textTheme.subtitle2,
                ),
                Icon(Icons.arrow_drop_up, color: AppTheme.upColor)
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
      secondChild: _selectedPortfolio == _portfolios.first
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 64),
              child: Theme(
                data: theme.copyWith(dividerColor: Colors.transparent),
                child: DataTable(
                  headingTextStyle: theme.textTheme.caption,
                  horizontalMargin: 4,
                  headingRowHeight: 30,
                  columnSpacing: 20,
                  sortColumnIndex: 3,
                  dataRowHeight: 64,
                  sortAscending: _sort,
                  columns: [
                    DataColumn(label: Container()),
                    DataColumn(label: Text(s.coins)),
                    DataColumn(label: Text(s.price)),
                    DataColumn(
                      label: Text(s.holdings),
                      numeric: true,
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          _sort = !_sort;
                        });
                        if (columnIndex == 3) onSortColumn(ascending);
                      },
                    ),
                  ],
                  rows: cryptoCoinsList
                      .sublist(0, 4)
                      .map((coin) => PortfolioCoinRow(coin, theme, context))
                      .toList(),
                ),
              ),
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 40,),
                  Image.asset(Assets.emptyPortfolio),
                  SizedBox(height: 20),
                  Text(s.your_portfolio_is_empty),
                  SizedBox(height: 12),
                  Text(
                    s.add_a_coin_to_get_started,
                    style: theme.textTheme.caption,
                  ),
                  SizedBox(height: 40,),
                ],
              ),
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, PageRoutes.addCoinPage),
        label: Text(s.add_coin.toUpperCase()),
        icon: Icon(Icons.add, size: 20),
        backgroundColor: theme.cardColor,
        foregroundColor: theme.textSelectionTheme.cursorColor,
      ),
      isBgColored: false,
      secondChildPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
    );
  }

  onSortColumn(bool ascending) {
    if (ascending) {
      cryptoCoinsList.sort((a, b) => a.holdings.compareTo(b.holdings));
    } else {
      cryptoCoinsList.sort((a, b) => b.holdings.compareTo(a.holdings));
    }
  }
}
