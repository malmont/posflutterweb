import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pos_flutter/features/products/domain/entities/product/style.dart';

import '../../../../design/design.dart';

class OrderAnalyticsPieWidget extends StatelessWidget {
  final List<Map<String, dynamic>> pieChartData = [
    {'status': 'En attente', 'count': 30},
    {'status': 'En préparation', 'count': 40},
    {'status': 'Livré', 'count': 20},
    {'status': 'Annulé', 'count': 10},
  ];

  OrderAnalyticsPieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primaryPalette,
      body: SizedBox(
        height: Units.sizedbox_250,
        child: PieChart(
          PieChartData(
            centerSpaceColor: Colours.primary100,
            sections: pieChartData.map((data) {
              return PieChartSectionData(
                titleStyle:
                    TextStyles.interRegularBody1.copyWith(color: Colours.white),
                color: Colours.colorsButtonMenu,
                value: data['count'].toDouble(),
                title: data['status'],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
