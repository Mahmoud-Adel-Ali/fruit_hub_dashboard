import 'package:flutter/material.dart';

import '../../../../../core/helper_function/dummy_order.dart';
import 'filter_section.dart';
import 'order_cart_item.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 12,
        children: [
          FilterSection(),
          OrderCartItem(order: DummyOrder.getOrder()),
        ],
      ),
    );
  }
}
