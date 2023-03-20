// To parse this JSON data, do
//
//     final pedidoRequestDto = pedidoRequestDtoFromJson(jsonString);

import 'dart:convert';

PedidoRequestDto pedidoRequestDtoFromJson(String str) =>
    PedidoRequestDto.fromJson(json.decode(str));

String pedidoRequestDtoToJson(PedidoRequestDto data) =>
    json.encode(data.toJson());

class PedidoRequestDto {
  PedidoRequestDto({
    required this.productoId,
    required this.cantidadProducto,
  });

  final int productoId;
  final int cantidadProducto;

  factory PedidoRequestDto.fromJson(Map<String, dynamic> json) =>
      PedidoRequestDto(
        productoId: json["productoId"],
        cantidadProducto: json["cantidadProducto"],
      );

  Map<String, dynamic> toJson() => {
        "productoId": productoId,
        "cantidadProducto": cantidadProducto,
      };
}
