import 'package:aluminex_client/features/home/cubit/home_cubit_states.dart';
import 'package:aluminex_client/repositorys/orders/orders_repository_impl.dart';
import 'package:aluminex_core/aluminex_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeInitialState());

  final orderRepository = OrdersRepositoryImpl();

  void initialize() async {
    await _getAllUserOrders('057.734.121-95');
  }

  Future<void> _getAllUserOrders(String userDocument) async {
    emit(HomeLoadingState());
    final result = await orderRepository.getAllUserOrders(userDocument);

    switch (result) {
      case Right(value: final ordersList):
        emit(HomeLoadedState(orders: ordersList));
      case Left(value: RepositoryException()):
        emit(HomeErrorState(message: 'Erro ao buscar pedidos'));
    }
  }
}
