// To parse this JSON data, do
//
//     final categoryResponseDto = categoryResponseDtoFromJson(jsonString);
import 'dart:convert';

CategoryResponseDto categoryResponseDtoFromJson(String str) =>
    CategoryResponseDto.fromJson(json.decode(str));

String categoryResponseDtoToJson(CategoryResponseDto data) =>
    json.encode(data.toJson());

class CategoryResponseDto {
  CategoryResponseDto({
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

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      CategoryResponseDto(
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
