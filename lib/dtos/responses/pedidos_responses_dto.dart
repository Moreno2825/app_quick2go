// To parse this JSON data, do
//
//     final pedidosResponseDto = pedidosResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PedidosResponseDto pedidosResponseDtoFromJson(String str) =>
    PedidosResponseDto.fromJson(json.decode(str));

String pedidosResponseDtoToJson(PedidosResponseDto data) =>
    json.encode(data.toJson());

class PedidosResponseDto {
  PedidosResponseDto({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.numeroTelefono,
  });

  final int id;
  final String nombre;
  final String apellidos;
  final String numeroTelefono;

  factory PedidosResponseDto.fromJson(Map<String, dynamic> json) =>
      PedidosResponseDto(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        numeroTelefono: json["numeroTelefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "numeroTelefono": numeroTelefono,
      };
}
