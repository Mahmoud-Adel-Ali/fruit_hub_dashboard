import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
}
