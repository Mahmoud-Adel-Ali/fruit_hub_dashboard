import 'package:flutter/material.dart';

import '../../../../../core/helper_function/dummy_order.dart';
import 'orders_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 12,
        children: [
          const SizedBox(),
          OrdersItemsListView(
            orders: List.generate(10, (index) => DummyOrder.getOrder()),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
