import 'dart:developer';

import 'package:aluminex_client/models/order.dart';
import 'package:aluminex_client/services/service_locator.dart';
import 'package:aluminex_core/aluminex_core.dart';
import 'package:dio/dio.dart';

import './orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final RestClient restClient = getIt.get<RestClient>();

  @override
  Future<Either<RepositoryException, List<Order>>> getAllUserOrders(String userDocument) async {
    try {
      final Response(:data) = await restClient.auth.get('/orders?client_document=$userDocument');

      return Right(Order.fromMapList(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar pedidos do cliente', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
