import 'package:aluminex_client/features/orders/widgets/custom_stepper.dart';
import 'package:aluminex_client/models/order.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as Order;

    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                opacity: 0.1,
                image: AssetImage('assets/images/logo_aluminex.jpeg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 50),
            child: SingleChildScrollView(
              child: SizedBox(
                height: sizeOf.height * .9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pedido #${order.id}',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.refresh,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: sizeOf.height * .5,
                      child: CustomStepper(orderStatus: order.status),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: const Color.fromRGBO(245, 55, 69, 1),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Voltar',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
