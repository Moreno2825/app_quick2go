// To parse this JSON data, do
//
//     final ventaResponseDto = ventaResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VentaResponseDto ventaResponseDtoFromJson(String str) =>
    VentaResponseDto.fromJson(json.decode(str));

String ventaResponseDtoToJson(VentaResponseDto data) =>
    json.encode(data.toJson());

class VentaResponseDto {
  VentaResponseDto({
    required this.id,
    required this.pedidoId,
    required this.direccion,
    required this.totalPago,
  });

  final int id;
  final int pedidoId;
  final String direccion;
  final double totalPago;

  factory VentaResponseDto.fromJson(Map<String, dynamic> json) =>
      VentaResponseDto(
        id: json["id"],
        pedidoId: json["pedidoId"],
        direccion: json["direccion"],
        totalPago: json["totalPago"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pedidoId": pedidoId,
        "direccion": direccion,
        "totalPago": totalPago,
      };
}
