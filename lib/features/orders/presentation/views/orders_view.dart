import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'widgets/filter_section.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [FilterSection()],
        backgroundColor: AppColors.lightGreyWithOpacity,
        flexibleSpace: Container(color: AppColors.lightGreyWithOpacity),
        title: Text('Orders', style: AppTextStyles.bold19),
      ),
      body: OrdersViewBody(),
    );
  }
}
