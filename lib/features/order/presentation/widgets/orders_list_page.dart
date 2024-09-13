import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/design/design.dart';
import 'package:pos_flutter/features/order/application/blocs/order_fetch/order_fetch_cubit.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'package:pos_flutter/features/products/presentation/widgets/generic_list.dart';

class OrdersListPage extends StatefulWidget {
  final List<OrderDetails> orders;
  final Function(OrderDetails) onSelectOrder; // Add the onSelectOrder callback

  const OrdersListPage(
      {super.key, required this.orders, required this.onSelectOrder});

  @override
  State<OrdersListPage> createState() => _OrdersListPageState();
}

int selectedDayIndex = 0;

final List<DaySelection> daySelections = [
  DaySelection(name: "10 jours", days: 10),
  DaySelection(name: "20 jours", days: 20),
  DaySelection(name: "30 jours", days: 30),
  DaySelection(name: "2 mois", days: 60),
  DaySelection(name: "6 mois", days: 180),
];

class _OrdersListPageState extends State<OrdersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primary100,
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colours.primary100,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Card(
                    color: Colours.primaryPalette,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 70),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.money_rounded,
                              color: Colours.colorsButtonMenu,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '1000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Total revenur",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colours.primaryPalette,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 70),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.money_rounded,
                              color: Colours.colorsButtonMenu,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '1000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Total revenur",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colours.primaryPalette,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 70),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.money_rounded,
                              color: Colours.colorsButtonMenu,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '1000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Total revenur",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          GenericList<DaySelection>(
            items: daySelections,
            selectedIndex: selectedDayIndex,
            onItemSelected: (index) {
              setState(() {
                selectedDayIndex = index;
                final selectedDays = daySelections[index].days;
                context.read<OrderFetchCubit>().getOrders(
                      FilterOrderParams(
                        orderSource: 2,
                        days: daySelections[index].days,
                      ),
                    );
              });
            },
            itemBuilder: (daySelection, isSelected) => Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Units.edgeInsetsXLarge,
                  vertical: Units.edgeInsetsXLarge),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Units.radiusXXLarge),
                color:
                    isSelected ? Colours.colorsButtonMenu : Colours.primary100,
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                daySelection.name,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colours.primary100,
              child: ListView.builder(
                itemCount: widget.orders.length,
                itemBuilder: (context, index) {
                  final order = widget.orders[index];
                  return GestureDetector(
                    onTap: () {
                      widget.onSelectOrder(order);
                    },
                    child: Card(
                      color: Colours.primaryPalette,
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeaderRow(order),
                            const SizedBox(width: 80),
                            _buildDetailsRow(
                                'Total Amount',
                                '\$${order.totalAmount.toStringAsFixed(2)}',
                                Colors.greenAccent),
                            const SizedBox(width: 80),
                            _buildDetailsRow(
                                'Order Date', order.orderDate, Colors.grey),
                            const SizedBox(width: 80),
                            _buildStatusRow(order),
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

  Widget _buildHeaderRow(OrderDetails order) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order ID: ${order.id}',
          style: TextStyles.interBoldH5.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          order.reference,
          style: TextStyles.interRegularBody1.copyWith(color: Colors.white),
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
        const SizedBox(height: 10),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusRow(OrderDetails order) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Status',
          style: TextStyles.interRegularBody1.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: _getStatusColor('Completed'),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Completed',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Preparing':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

class DaySelection {
  final String name; // Nom qui sera affiché
  final int days; // Nombre de jours correspondant

  DaySelection({required this.name, required this.days});
}
