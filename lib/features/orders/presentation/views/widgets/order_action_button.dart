import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/order_enum.dart';
import '../../../domain/entities/order_entity.dart';
import '../../manager/update_order_cubit/update_order_cubit.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatus.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatus.accepted,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatus.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatus.cancelled,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Reject'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatus.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatus.delivered,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
