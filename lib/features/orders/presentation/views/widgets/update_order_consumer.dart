import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_progress_hub.dart';
import '../../manager/update_order_cubit/update_order_cubit.dart';

class UpdateOrderConsumer extends StatelessWidget {
  const UpdateOrderConsumer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Order Updated Successfully!')),
          );
        } else if (state is UpdateOrderFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return CustomProgressHub(
          isLoading: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
