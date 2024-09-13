import 'package:flutter/material.dart';
import 'package:pos_flutter/design/colours.dart';

class StatistiquePageView extends StatelessWidget {
  const StatistiquePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.primaryPalette,
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistics',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Total Orders: 123',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Completed Orders: 100',
            style: TextStyle(
              fontSize: 18,
              color: Colors.greenAccent,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Pending Orders: 23',
            style: TextStyle(
              fontSize: 18,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
