import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helper_function/dummy_order.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../domain/repos/orders_repo.dart';
import '../manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import '../manager/update_order_cubit/update_order_cubit.dart';
import 'widgets/filter_section.dart';
import 'widgets/orders_view_body.dart';
import 'widgets/update_order_consumer.dart';

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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<FetchOrdersCubit>(
            create: (context) =>
                FetchOrdersCubit(repo: getit.get<OrdersRepo>()),
          ),
          BlocProvider<UpdateOrderCubit>(
            create: (context) =>
                UpdateOrderCubit(repo: getit.get<OrdersRepo>()),
          ),
        ],
        child: const UpdateOrderConsumer(child: OrdersViewBodyBlocConsumer()),
      ),
    );
  }
}

class OrdersViewBodyBlocConsumer extends StatefulWidget {
  const OrdersViewBodyBlocConsumer({super.key});

  @override
  State<OrdersViewBodyBlocConsumer> createState() =>
      _OrdersViewBodyBlocConsumerState();
}

class _OrdersViewBodyBlocConsumerState
    extends State<OrdersViewBodyBlocConsumer> {
  @override
  void initState() {
    super.initState();
    context.read<FetchOrdersCubit>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchOrdersCubit, FetchOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text(state.message));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: List.generate(3, (index) => DummyOrder.getOrder()),
            ),
          );
        }
      },
    );
  }
}
