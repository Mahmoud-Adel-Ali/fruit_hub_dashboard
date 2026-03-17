import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Orders', style: AppTextStyles.bold19),
      ),
      body: OrdersViewBody(),
    );
  }
}
