import 'package:aluminex_client/models/door.dart';

class Order {
  int id;
  String clientDocument;
  String createdAt;
  double totalPrice;
  String status;
  List<Door> doors;

  Order({
    required this.id,
    required this.clientDocument,
    required this.createdAt,
    required this.totalPrice,
    required this.status,
    required this.doors,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      clientDocument: map['client_document'],
      createdAt: map['created_at'],
      totalPrice: map['total_price'],
      status: map['status'],
      doors: Door.fromMapList(map['doors']),
    );
  }

  static fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => Order.fromMap(map)).toList();
  }
}
