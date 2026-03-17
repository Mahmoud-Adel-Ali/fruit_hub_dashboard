import 'package:flutter/widgets.dart';

import '../../../data/models/order_model.dart';
import 'order_cart_item.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orders});

  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        return OrderCartItem(order: orders[index]);
      },
    );
  }
}
