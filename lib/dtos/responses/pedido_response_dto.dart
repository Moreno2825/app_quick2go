// To parse this JSON data, do
//
//     final pedidoResponseDto = pedidoResponseDtoFromJson(jsonString);

// To parse this JSON data, do
//
//     final pedidoResponseDto = pedidoResponseDtoFromJson(jsonString);

import 'dart:convert';

PedidoResponseDto pedidoResponseDtoFromJson(String str) => PedidoResponseDto.fromJson(json.decode(str));

String pedidoResponseDtoToJson(PedidoResponseDto data) => json.encode(data.toJson());

class PedidoResponseDto {
    PedidoResponseDto({
        required this.id,
        required this.cantidadProducto,
        required this.subTotal,
        required this.producto,
    });

    final int id;
    final int cantidadProducto;
    final double subTotal;
    final Producto producto;

    factory PedidoResponseDto.fromJson(Map<String, dynamic> json) => PedidoResponseDto(
        id: json["id"],
        cantidadProducto: json["cantidadProducto"],
        subTotal: json["subTotal"]?.toDouble(),
        producto: Producto.fromJson(json["producto"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
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
        required this.categoria,
    });

    final int id;
    final String nombreProducto;
    final String descripcion;
    final double precio;
    final String foto;
    final Categoria categoria;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombreProducto: json["nombreProducto"],
        descripcion: json["descripcion"],
        precio: json["precio"]?.toDouble(),
        foto: json["foto"],
        categoria: Categoria.fromJson(json["categoria"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombreProducto": nombreProducto,
        "descripcion": descripcion,
        "precio": precio,
        "foto": foto,
        "categoria": categoria.toJson(),
    };
}

class Categoria {
    Categoria({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.estado,
        required this.foto,
    });

    final int id;
    final String nombre;
    final String descripcion;
    final String estado;
    final String foto;

    factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        estado: json["estado"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "estado": estado,
        "foto": foto,
    };
}
