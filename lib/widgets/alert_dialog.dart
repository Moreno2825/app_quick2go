import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/dtos/responses/product_response_dto.dart';
import 'package:test1/providers/pedidos_provide.dart';

// ignore: camel_case_types
class modalProduct extends StatelessWidget {
  const modalProduct({
    super.key,
    required this.product,
  });

  final ProductResponseDto product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Image.network(
                    product.foto,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.nombreProducto,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.descripcion,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Precio:",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "\$${product.precio}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              int cantidad =
                                  1; // Cantidad de productos seleccionados
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                title: const Text('Agregar al carrito'),
                                content: TextFormField(
                                  initialValue: '1',
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    cantidad = int.tryParse(value) ?? 1;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Ingrese una cantidad válida';
                                    }
                                    final parsedValue = int.tryParse(value);
                                    if (parsedValue == null ||
                                        parsedValue <= 0) {
                                      return 'Ingrese una cantidad válida';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Cantidad',
                                    hintText:
                                        'Ingrese la cantidad de productos que desea agregar',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                kPrimaryColor)),
                                    onPressed: () {
                                      final pedidoProvider =
                                          Provider.of<PedidoProvider>(context,
                                              listen: false);
                                      pedidoProvider.addPedido(
                                        product.id,
                                        cantidad,
                                      );
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Producto agregado al carrito'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: const Text('ACEPTAR'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.shopping_cart),
                            SizedBox(width: 8),
                            Text('AGREGAR')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      child: SizedBox(
        width: 169,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 280,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                      )
                    ],
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      product.foto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Fluttertoast.showToast(
//                               msg:
//                                   '¡${product.nombreProducto} se agregó al carrito!',
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.BOTTOM,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.grey[300],
//                               textColor: Colors.black,
//                               fontSize: 16.0,
//                             );
