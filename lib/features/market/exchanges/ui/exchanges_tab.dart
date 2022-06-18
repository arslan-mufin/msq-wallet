import 'package:cryptox/features/market/exchanges/ui/exchange_row.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/exchange_data.dart';
import 'package:flutter/material.dart';

class ExchangeTab extends StatefulWidget {
  @override
  _ExchangeTabState createState() => _ExchangeTabState();
}

class _ExchangeTabState extends State<ExchangeTab> {
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
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
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
            sortColumnIndex: 2,
            dataRowHeight: 64,
            sortAscending: _sort,
            columns: [
              DataColumn(label: Container()),
              DataColumn(label: Text(s.exchanges)),
              DataColumn(
                label: Text(s.market_cap),
                numeric: true,
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _sort = !_sort;
                  });
                  if (columnIndex == 2) onSortColumn(ascending);
                },
              ),
            ],
            rows: exchanges
                .map((exchange) => ExchangeRow(exchange, theme, context))
                .toList(),
          ),
        ),
      ),
    );
  }

  onSortColumn(bool ascending) {
    if (ascending) {
      exchanges.sort((a, b) => a.volume.compareTo(b.volume));
    } else {
      exchanges.sort((a, b) => b.volume.compareTo(a.volume));
    }
  }
}
