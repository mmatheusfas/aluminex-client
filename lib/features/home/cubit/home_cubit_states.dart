import 'package:aluminex_client/models/order.dart';

abstract class HomeCubitState {}

class HomeInitialState extends HomeCubitState {}

class HomeLoadingState extends HomeCubitState {}

class HomeLoadedState extends HomeCubitState {
  final List<Order> orders;

  HomeLoadedState({required this.orders});
}

class HomeErrorState extends HomeCubitState {
  final String message;

  HomeErrorState({required this.message});
}
