import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_flutter/features/order/domain/entities/order_details.dart';
import 'package:pos_flutter/features/order/domain/entities/order_item.dart';
import '../../../../design/design.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderDetails orderDetails;
  final VoidCallback onBack;

  const OrderDetailsPage(
      {super.key, required this.orderDetails, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${orderDetails.id}'),
        backgroundColor: Colours.primary100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: Container(
        color: Colours.primary100,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderInfoCard(),
            const SizedBox(height: 20),
            const Text(
              'Items:',
              style: TextStyles.interBoldH6,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: orderDetails.orderItems.length,
                itemBuilder: (context, index) {
                  final item = orderDetails.orderItems[index];
                  return _buildItemCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfoCard() {
    return Card(
      color: Colours.primaryPalette,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoColumn('Order Reference', orderDetails.reference),
            const SizedBox(height: 10),
            _buildInfoColumn('Total Amount',
                '\$${orderDetails.totalAmount.toStringAsFixed(2)}'),
            const SizedBox(height: 10),
            _buildInfoColumn('Order Date', orderDetails.orderDate),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.interBoldBody1.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyles.interBoldBody1.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildItemCard(OrderItem item) {
    return Card(
      color: Colours.primaryPalette,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: item.productImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item.productVariantName,
              style: TextStyles.interBoldBody1.copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              'Quantity: ${item.quantity}',
              style:
                  TextStyles.interRegularBody1.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 6),
            Text(
              'Price: \$${item.totalPrice.toStringAsFixed(2)}',
              style: TextStyles.interRegularBody1
                  .copyWith(color: Colors.greenAccent),
            ),
          ],
        ),
      ),
    );
  }
}
