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
  });

  final int id;
  final String nombreProducto;
  final String descripcion;
  final double precio;
  final String foto;

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductResponseDto(
        id: json["id"],
        nombreProducto: json["nombreProducto"],
        descripcion: json["descripcion"],
        precio: json["precio"],
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
