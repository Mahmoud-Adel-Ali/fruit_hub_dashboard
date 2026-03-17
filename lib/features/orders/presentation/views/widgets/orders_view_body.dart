import 'package:flutter/material.dart';

import 'filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          FilterSection(),
          //
        ],
      ),
    );
  }
}
