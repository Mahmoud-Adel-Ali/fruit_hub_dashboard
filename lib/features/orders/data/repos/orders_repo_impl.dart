import 'package:dartz/dartz.dart';

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
      final response = await service.getData(path: EndPoints.getOrders) as List;
      var orders = response
          .map((e) => OrderModel.fromJson(e).toEntity())
          .toList();
      yield Right(orders);
    } catch (e) {
      yield Left(ServerFailure('failed to fetch orders!.'));
    }
  }
}
