// To parse this JSON data, do
//
//     final ventaResponseDto = ventaResponseDtoFromJson(jsonString);

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
    required this.pedido,
  });

  final int id;
  final int pedidoId;
  final String direccion;
  final double totalPago;
  final Pedido pedido;

  factory VentaResponseDto.fromJson(Map<String, dynamic> json) =>
      VentaResponseDto(
        id: json["id"],
        pedidoId: json["pedidoId"],
        direccion: json["direccion"],
        totalPago: json["totalPago"]?.toDouble(),
        pedido: Pedido.fromJson(json["pedido"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pedidoId": pedidoId,
        "direccion": direccion,
        "totalPago": totalPago,
        "pedido": pedido.toJson(),
      };
}

class Pedido {
  Pedido({
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

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
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
    required this.categoriaId,
    required this.precio,
    required this.foto,
    required this.categoria,
  });

  final int id;
  final String nombreProducto;
  final String descripcion;
  final int categoriaId;
  final double precio;
  final String foto;
  final dynamic categoria;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombreProducto: json["nombreProducto"],
        descripcion: json["descripcion"],
        categoriaId: json["categoriaId"],
        precio: json["precio"]?.toDouble(),
        foto: json["foto"],
        categoria: json["categoria"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreProducto": nombreProducto,
        "descripcion": descripcion,
        "categoriaId": categoriaId,
        "precio": precio,
        "foto": foto,
        "categoria": categoria,
      };
}
