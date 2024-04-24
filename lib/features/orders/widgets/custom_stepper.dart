import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key, required this.orderStatus});

  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              backgroundColor: Color.fromRGBO(245, 55, 69, 1),
              child: Icon(Icons.check),
            ),
            const Expanded(
              child: VerticalDivider(
                color: Color.fromRGBO(245, 55, 69, 1),
                thickness: 3,
              ),
            ),
            CircleAvatar(
              backgroundColor: orderStatus == 'emProducao' || orderStatus == 'emFinalizacao' || orderStatus == 'pronto'
                  ? const Color.fromRGBO(245, 55, 69, 1)
                  : Colors.grey.shade400,
              child: orderStatus == 'emProducao' || orderStatus == 'emFinalizacao' || orderStatus == 'pronto'
                  ? const Icon(Icons.check)
                  : null,
            ),
            Expanded(
              child: VerticalDivider(
                color: orderStatus == 'emProducao' || orderStatus == 'emFinalizacao' || orderStatus == 'pronto'
                    ? const Color.fromRGBO(245, 55, 69, 1)
                    : Colors.grey.shade400,
                thickness: 3,
              ),
            ),
            CircleAvatar(
              backgroundColor: orderStatus == 'emFinalizacao' || orderStatus == 'pronto'
                  ? const Color.fromRGBO(245, 55, 69, 1)
                  : Colors.grey.shade400,
              child: orderStatus == 'emFinalizacao' || orderStatus == 'pronto' ? const Icon(Icons.check) : null,
            ),
            Expanded(
              child: VerticalDivider(
                color: orderStatus == 'emFinalizacao' || orderStatus == 'pronto'
                    ? const Color.fromRGBO(245, 55, 69, 1)
                    : Colors.grey.shade400,
                thickness: 3,
              ),
            ),
            CircleAvatar(
              backgroundColor: orderStatus == 'pronto' ? const Color.fromRGBO(245, 55, 69, 1) : Colors.grey.shade400,
              child: orderStatus == 'pronto' ? const Icon(Icons.check) : null,
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Pedido Confirmado',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Pedido confirmado! Logo irá para produção',
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
              Text(
                'Pedido em Produção',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Seu pedido já está sendo produzido',
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
              Text(
                'Pedido em Finalização',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Acertando os ultimos detalhes',
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
              Text(
                'Pedido Entregue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Seu pedido foi entregue, obrigado!',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }
}
