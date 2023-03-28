// To parse this JSON data, do
//
//     final ventaCreateRequestDto = ventaCreateRequestDtoFromJson(jsonString);

import 'dart:convert';

VentaCreateRequestDto ventaCreateRequestDtoFromJson(String str) =>
    VentaCreateRequestDto.fromJson(json.decode(str));

String ventaCreateRequestDtoToJson(VentaCreateRequestDto data) =>
    json.encode(data.toJson());

class VentaCreateRequestDto {
  VentaCreateRequestDto({
    required this.pedidoId,
    required this.direccion,
  });

  final int pedidoId;
  final String direccion;

  factory VentaCreateRequestDto.fromJson(Map<String, dynamic> json) =>
      VentaCreateRequestDto(
        pedidoId: json["pedidoId"],
        direccion: json["direccion"],
      );

  Map<String, dynamic> toJson() => {
        "pedidoId": pedidoId,
        "direccion": direccion,
      };
}
