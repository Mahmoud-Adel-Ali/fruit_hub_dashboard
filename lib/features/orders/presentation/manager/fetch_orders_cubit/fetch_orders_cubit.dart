import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/order_entity.dart';
import '../../../domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit({required this.repo}) : super(FetchOrdersInitial());
  final OrdersRepo repo;

  void fetchOrders() async {
    emit(FetchOrdersLoading());

    await for (var result in repo.fetchOrders()) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(message: failure.message)),
        (orders) => emit(FetchOrdersSuccess(orders: orders)),
      );
    }
  }
}
