import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../dtos/requests/venta_requests_dto.dart';
import '../dtos/responses/venta_response_dto.dart';

class VentasProvider extends ChangeNotifier {
  final logger = Logger();

  List<VentaResponseDto>? _ventas;

  bool isLoading = true;

  List<VentaResponseDto>? get ventas => _ventas;

  Future fetchVentas() async {
    final response = await http
        .get(Uri.parse('http://www.quick2goapiprod.somee.com/api/ventas'));
    logger.d(response);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      logger.d(response.body);
      final List<dynamic> data = json;
      logger.d(data);
      _ventas = data.map((venta) => VentaResponseDto.fromJson(venta)).toList();
      isLoading = false;

      notifyListeners();
    } else {
      logger.d(response.statusCode);
      throw Exception('Failed');
    }
  }

  Future createVenta(
      int pedidoId, String direccion, BuildContext context) async {
    final venta =
        VentaCreateRequestDto(pedidoId: pedidoId, direccion: direccion);

    final response = await http.post(
      Uri.parse('http://www.quick2goapiprod.somee.com/api/ventas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(venta),
    );
    if (response.statusCode == 200) {
      logger.d('Venta: ${response.body}');
      notifyListeners();
      await fetchVentas();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Venta exitosa')),
        );
        Navigator.pop(context);
      }
      // Agregar esta línea para actualizar la lista de ventas después de crear una nueva venta
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}!')),
        );
      }
    }
  }
}
