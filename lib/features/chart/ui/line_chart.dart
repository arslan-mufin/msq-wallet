import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomChart extends StatelessWidget {
  final Color color;
  final List<FlSpot> flSpots;

  CustomChart(this.color, this.flSpots);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).backgroundColor,
        Theme.of(context).backgroundColor.withOpacity(0.7),
        Theme.of(context).backgroundColor.withOpacity(0),
      ])),
      child: LineChart(mainData()),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineTouchData: LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          spots: flSpots,
          isCurved: true,
          colors: [color],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
