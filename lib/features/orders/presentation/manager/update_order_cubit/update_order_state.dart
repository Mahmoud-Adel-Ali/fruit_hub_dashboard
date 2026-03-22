part of 'update_order_cubit.dart';

@immutable
abstract class UpdateOrderState {}

class UpdateOrderInitial extends UpdateOrderState {}

class UpdateOrderLoading extends UpdateOrderState {}

class UpdateOrderSuccess extends UpdateOrderState {}

class UpdateOrderFailure extends UpdateOrderState {
  final String message;

  UpdateOrderFailure({required this.message});
}
