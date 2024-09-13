import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../design/design.dart';

class OrderAnalyticsLineChart extends StatelessWidget {
  final List<Map<String, dynamic>> lineChartData = [
    {'day': '2024-09-01', 'orders': 20},
    {'day': '2024-09-02', 'orders': 35},
    {'day': '2024-09-03', 'orders': 40},
    {'day': '2024-09-04', 'orders': 28},
    {'day': '2024-09-05', 'orders': 45},
    {'day': '2024-09-06', 'orders': 30},
    {'day': '2024-09-07', 'orders': 50},
  ];

  OrderAnalyticsLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primaryPalette,
      body: Padding(
        padding: const EdgeInsets.all(Units.edgeInsetsXXLarge),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(Units.edgeInsetsLarge),
              child: SizedBox(
                height: Units.sizedbox_280,
                child: LineChart(
                  LineChartData(
                    backgroundColor: Colours.primary100,
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}',
                              style: TextStyles.interItalicTiny.copyWith(
                                color: Colours.colorsButtonMenu,
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}',
                              style: TextStyles.interItalicTiny.copyWith(
                                color: Colours.colorsButtonMenu,
                              ),
                            );
                          },
                          reservedSize: 42,
                        ),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        color: Colours.colorsButtonMenu,
                        spots: lineChartData.map((data) {
                          final day =
                              DateTime.parse(data['day']).day.toDouble();
                          return FlSpot(day, data['orders'].toDouble());
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 260,
              left: 0,
              child: RotatedBox(
                quarterTurns: 0,
                child: Text(
                  'Orders',
                  style: TextStyles.interSemiBoldTiny
                      .copyWith(color: Colours.colorsButtonMenu),
                ),
              ),
            ),
            Positioned(
              bottom: -2,
              right: 0,
              child: Text(
                'Day',
                style: TextStyles.interSemiBoldTiny
                    .copyWith(color: Colours.colorsButtonMenu),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
