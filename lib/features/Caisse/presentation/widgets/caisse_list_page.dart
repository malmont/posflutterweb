import 'package:flutter/material.dart';
import 'package:pos_flutter/design/design.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/caisse.dart';

class CaisseListPage extends StatefulWidget {
  final List<Caisse> caisses;
  final Function(Caisse) onSelectCaisse; // Add the onSelectCaisse callback

  const CaisseListPage(
      {super.key, required this.caisses, required this.onSelectCaisse});

  @override
  State<CaisseListPage> createState() => _CaisseListPageState();
}

class _CaisseListPageState extends State<CaisseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primary100,
      appBar: AppBar(
        title: const Text('Caisses'),
        backgroundColor: Colours.primary100,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colours.primary100,
              child: ListView.builder(
                itemCount: widget.caisses.length,
                itemBuilder: (context, index) {
                  final caisse = widget.caisses[index];
                  return GestureDetector(
                    onTap: () {
                      widget.onSelectCaisse(caisse);
                    },
                    child: Card(
                      color: Colours.primaryPalette,
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: Units.edgeInsetsLarge,
                          horizontal: Units.edgeInsetsXXLarge),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Units.edgeInsetsXXLarge),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeaderRow(caisse),
                            const SizedBox(width: Units.sizedbox_80),
                            _buildDetailsRow(
                                'Montant Total',
                                '\$${(caisse.amountTotal / 100).toStringAsFixed(2)}',
                                Colors.greenAccent),
                            const SizedBox(width: Units.sizedbox_80),
                            _buildDetailsRow('Date de création',
                                caisse.createdAt, Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(Caisse caisse) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Caisse ID: ${caisse.id}',
          style: TextStyles.interBoldH5.copyWith(color: Colors.white),
        ),
        const SizedBox(height: Units.sizedbox_10),
        Text(
          caisse.isOpen ? 'Ouverte' : 'Fermée',
          style: TextStyles.interRegularBody1
              .copyWith(color: caisse.isOpen ? Colors.green : Colors.red),
        ),
      ],
    );
  }

  Widget _buildDetailsRow(String label, String value, Color valueColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.interRegularBody1.copyWith(color: Colors.white),
        ),
        const SizedBox(height: Units.sizedbox_10),
        Text(
          value,
          style: TextStyles.interRegularBody1
              .copyWith(color: Colours.colorsButtonMenu),
        ),
      ],
    );
  }
}
