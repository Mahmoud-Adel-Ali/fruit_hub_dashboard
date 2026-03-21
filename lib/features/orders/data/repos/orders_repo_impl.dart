import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/utils/end_points.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repos/orders_repo.dart';
import '../models/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService service;

  OrdersRepoImpl({required this.service});

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      // (data as List<Map<String, dynamic>>)
      await for (List data in service.streamData(path: EndPoints.getOrders)) {
        var orders = data
            .map((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure('failed to fetch orders!.'));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus({
    required OrderStatus status,
    required String orderId,
  }) {
    // TODO: implement updateOrderStatus
    throw UnimplementedError();
  }
}
