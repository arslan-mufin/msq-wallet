import 'package:cryptox/features/market/categories/ui/category_row.dart';
import 'package:cryptox/generated/l10n.dart';
import 'package:cryptox/models/category_data.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  bool _sort = false;
  late List<Category> categories;
  late S s;

  @override
  void didChangeDependencies() {
    s = S.of(context);
    categories = [
      Category(s.options, 55172912, -2.4),
      Category(s.jobs, 1799476, -2.4),
      Category(s.sharing_economy, 2095605139, -2.4),
      Category(s.derivative, 5591481061, -2.4),
      Category(s.polka, 15559754, -2.4),
      Category(s.options, 55172912, -2.4),
      Category(s.jobs, 1799476, -2.4),
      Category(s.sharing_economy, 2095605139, -2.4),
      Category(s.derivative, 5591481061, -2.4),
      Category(s.polka, 15559754, -2.4),
    ];
    onSortColumn(_sort);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
            sortColumnIndex: 1,
            dataRowHeight: 80,
            sortAscending: _sort,
            columns: [
              DataColumn(label: Text(s.category)),
              DataColumn(
                label: Text(s.market_cap),
                numeric: true,
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _sort = !_sort;
                  });
                  if (columnIndex == 1) onSortColumn(ascending);
                },
              ),
            ],
            rows: categories
                .map((category) => CategoryRow(category, theme, context))
                .toList(),
          ),
        ),
      ),
    );
  }

  onSortColumn(bool ascending) {
    if (ascending) {
      categories.sort((a, b) => a.marketCap.compareTo(b.marketCap));
    } else {
      categories.sort((a, b) => b.marketCap.compareTo(a.marketCap));
    }
  }
}
