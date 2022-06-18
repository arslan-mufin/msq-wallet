import 'package:cryptox/models/category_data.dart';
import 'package:cryptox/routes/routes.dart';
import 'package:flutter/material.dart';

class CategoryRow extends DataRow {
  final Category category;
  final ThemeData theme;
  final context;

  CategoryRow(this.category, this.theme, this.context)
      : super(
          cells: [
            DataCell(
                Text(category.name),
            onTap: (){
              Navigator.pushNamed(context, PageRoutes.categoryTabOptions);
            }
            ),
            DataCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$ ${category.marketCap}"),
                  Text(
                    category.percentage.toString() + "%",
                    style: theme.textTheme.overline!
                        .copyWith(color: theme.dividerColor),
                  ),
                ],
              ),
                onTap: (){
                  Navigator.pushNamed(context, PageRoutes.categoryTabOptions);
                }
            ),
          ],
        );
}
