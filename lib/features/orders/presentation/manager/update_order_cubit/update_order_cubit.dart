import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/order_enum.dart';
import '../../../domain/repos/orders_repo.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit({required this.repo}) : super(UpdateOrderInitial());
  final OrdersRepo repo;

  void updateOrder({
    required OrderStatus status,
    required String orderId,
  }) async {
    emit(UpdateOrderLoading());
    final result = await repo.updateOrder(status: status, orderId: orderId);
    result.fold(
      (failure) => emit(UpdateOrderFailure(message: failure.message)),
      (_) => emit(UpdateOrderSuccess()),
    );
  }
}
