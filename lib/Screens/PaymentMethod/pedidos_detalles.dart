import 'package:flutter/material.dart';

import '../../dtos/responses/pedidos_responses_dto.dart';

class UserDetailsScreen extends StatelessWidget {
  final PedidosResponseDto pedido;
  const UserDetailsScreen({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Card(
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Id: ${pedido.id}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${pedido.apellidos}",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                
              ], //TODO: PENDING
            ),
          ),
        ),
      ),
    );
  }
}
