// To parse this JSON data, do
//
//     final pedidoResponseDto = pedidoResponseDtoFromJson(jsonString);

import 'dart:convert';

PedidoResponseDto pedidoResponseDtoFromJson(String str) => PedidoResponseDto.fromJson(json.decode(str));

String pedidoResponseDtoToJson(PedidoResponseDto data) => json.encode(data.toJson());

class PedidoResponseDto {
    PedidoResponseDto({
        required this.id,
        required this.productoId,
        required this.cantidadProducto,
        required this.subTotal,
        required this.producto,
    });

    final int id;
    final int productoId;
    final int cantidadProducto;
    final double subTotal;
    final Producto producto;

    factory PedidoResponseDto.fromJson(Map<String, dynamic> json) => PedidoResponseDto(
        id: json["id"],
        productoId: json["productoId"],
        cantidadProducto: json["cantidadProducto"],
        subTotal: json["subTotal"]?.toDouble(),
        producto: Producto.fromJson(json["producto"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "productoId": productoId,
        "cantidadProducto": cantidadProducto,
        "subTotal": subTotal,
        "producto": producto.toJson(),
    };
}

class Producto {
    Producto({
        required this.id,
        required this.nombreProducto,
        required this.descripcion,
        required this.precio,
        required this.foto,
    });

    final int id;
    final String nombreProducto;
    final String descripcion;
    final double precio;
    final String foto;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombreProducto: json["nombreProducto"],
        descripcion: json["descripcion"],
        precio: json["precio"]?.toDouble(),
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombreProducto": nombreProducto,
        "descripcion": descripcion,
        "precio": precio,
        "foto": foto,
    };
}
