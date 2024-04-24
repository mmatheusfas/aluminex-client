import 'package:aluminex_core/aluminex_core.dart';

import '../../models/order.dart';

abstract interface class OrdersRepository {
  Future<Either<RepositoryException, List<Order>>> getAllUserOrders(String userDocument);
}
