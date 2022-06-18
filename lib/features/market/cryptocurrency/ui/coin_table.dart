import 'package:cryptox/features/market/cryptocurrency/ui/cryptocurrency_coin_row.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/crypto_coin_data.dart';
import 'package:flutter/material.dart';

class CoinTable extends StatefulWidget {
  final bool showFavourite;

  CoinTable(this.showFavourite);

  @override
  _CoinTableState createState() => _CoinTableState();
}

class _CoinTableState extends State<CoinTable> {
  bool _sort = false;

  @override
  void initState() {
    super.initState();
    onSortColumn(_sort);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: DataTable(
            headingTextStyle: theme.textTheme.caption,
            horizontalMargin: 20,
            headingRowHeight: 40,
            headingRowColor:
                MaterialStateProperty.all(theme.scaffoldBackgroundColor),
            columnSpacing: 20,
            showCheckboxColumn: false,
            sortColumnIndex: 3,
            dataRowHeight: 80,
            sortAscending: _sort,
            columns: [
              DataColumn(label: Text(s.coins)),
              DataColumn(label: Container()),
              DataColumn(label: Text(s.chart)),
              DataColumn(
                label: Text(s.price),
                numeric: true,
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _sort = !_sort;
                  });
                  if (columnIndex == 3) onSortColumn(ascending);
                },
              ),
            ],
            rows: (widget.showFavourite
                    ? cryptoCoinsList.sublist(0, 4)
                    : cryptoCoinsList)
                .map((coin) => CryptocurrencyCoinRow(context, coin, theme))
                .toList(),
          ),
        ),
      ),
    );
  }

  onSortColumn(bool ascending) {
    if (ascending) {
      cryptoCoinsList.sort((a, b) => a.price.compareTo(b.price));
    } else {
      cryptoCoinsList.sort((a, b) => b.price.compareTo(a.price));
    }
  }
}
