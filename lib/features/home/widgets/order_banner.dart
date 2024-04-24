import 'package:aluminex_client/models/order.dart';
import 'package:aluminex_client/support/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class OrderBanner extends StatelessWidget {
  const OrderBanner({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/order', arguments: order);
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            height: 150,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
              image: const DecorationImage(
                opacity: 0.5,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/login_background.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '#${order.id}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      order.status == 'emProducao' || order.status == 'emFinalizacao' || order.status == 'pedidoFeito'
                          ? 'Ativo'
                          : 'Finalizado',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Preço total : R\$ ${order.totalPrice}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.door_sliding_outlined,
                      color: Colors.grey.shade900,
                    ),
                    Text(
                      ': ${order.doors.length}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Text(
                  '●',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  order.createdAt.formatedDate(order.createdAt),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
