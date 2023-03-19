// To parse this JSON data, do
//
//     final productResponseDto = productResponseDtoFromJson(jsonString);
import 'dart:convert';

ProductResponseDto productResponseDtoFromJson(String str) =>
    ProductResponseDto.fromJson(json.decode(str));

String productResponseDtoToJson(ProductResponseDto data) =>
    json.encode(data.toJson());

class ProductResponseDto {
  ProductResponseDto({
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

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductResponseDto(
        id: json["id"],
        nombreProducto: json["nombreProducto"],
        descripcion: json["descripcion"],
        precio: json["precio"],
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
  });

  final int id;
  final String nombre;
  final String descripcion;
  final String estado;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "estado": estado,
      };
}
