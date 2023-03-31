import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:test1/dtos/responses/pedido_response_dto.dart';

class PedidoProvider extends ChangeNotifier {
  final logger = Logger();

  List<PedidoResponseDto> _pedidos = [];
  bool isLoading = true;

  List<PedidoResponseDto> get pedidos => _pedidos;

  Future<int?> addPedido(int productoId, int cantidadProducto) async {
    int? pedidoId;
    try {
      final pedido = {
        'productoId': productoId,
        'cantidadProducto': cantidadProducto,
      };

      final response = await http.post(
        Uri.parse('http://www.quick2goapiprod.somee.com/api/pedidos'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(pedido),
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final pedido = PedidoResponseDto.fromJson(jsonResponse);
        final pedidoId = pedido.id;
        logger.d(pedido);

        _pedidos.add(pedido);

        notifyListeners();
        await fetchPedidos();
      } else {
        throw Exception('Failed to add pedido');
      }
    } catch (e) {
      print('Error al agregar el pedido: $e');
    }
    return pedidoId;
  }

  Future fetchPedidos() async {
    final response = await http.get(
        Uri.parse('http://www.quick2goapiprod.somee.com/api/pedidos'),
        headers: <String, String>{'content-type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;
      logger.d(json);
      _pedidos =
          data.map((pedido) => PedidoResponseDto.fromJson(pedido)).toList();

      isLoading = false;

      notifyListeners();
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<void> eliminarPedido(int idPedido) async {
    try {
      final response = await http.delete(
        Uri.parse('http://www.quick2goapiprod.somee.com/api/pedidos/$idPedido'),
        headers: <String, String>{'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Si la eliminación fue exitosa en la API, elimina el pedido de la lista local
        _pedidos.removeWhere((pedido) => pedido.id == idPedido);
        notifyListeners();
      } else {
        throw Exception('No se pudo eliminar el pedido');
      }
    } catch (e) {
      throw Exception('No se pudo eliminar el pedido: $e');
    }
  }

  Future<void> eliminarTodo() async {
    try {
      final response = await http.delete(
        Uri.parse('http://www.quick2goapiprod.somee.com/api/pedidos'),
        headers: <String, String>{'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Si la eliminación fue exitosa en la API, eliminar todos los pedidos localmente
        _pedidos.clear();
        notifyListeners();
      } else {
        throw Exception('No se pudieron eliminar todos los pedidos');
      }
    } catch (e) {
      throw Exception('No se pudieron eliminar todos los pedidos: $e');
    }
  }

  double getTotal() {
    double total = 0;
    for (final pedido in _pedidos) {
      total += pedido.subTotal;
    }
    return total;
  }
}
