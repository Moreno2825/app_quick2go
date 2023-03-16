import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/category_page.dart';
import 'package:test1/providers/categories_provider.dart';

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context, categoriesProvider, child) => categoriesProvider
              .isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              constraints: const BoxConstraints(maxHeight: 460),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final category in categoriesProvider.categories!)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              category.nombre,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, left: 8, right: 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const CategoryPage()));
                              },
                              child: Card(
                                semanticContainer: true,
                                margin: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                elevation: 4,
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        category.foto,
                                        fit: BoxFit.fitWidth,
                                        height: 200,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black.withOpacity(0.8),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 16,
                                      ),
                                      child: Text(
                                        category.descripcion,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}

// SizedBox(
//               height: 380,
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisSpacing: 20,
//                   crossAxisCount: 2,
//                   childAspectRatio: 9 / 16,
//                 ),
//                 itemCount: productsProvider.products?.length,
//                 itemBuilder: (context, index) {
//                   final product = productsProvider.products![index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         // Agrega el producto al carrito
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: kPrimaryLightColor,
//                           borderRadius: BorderRadius.circular(28),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(28),
//                               child: Expanded(
//                                 flex: 2,
//                                 child: Image.network(
//                                   product.foto,
//                                   fit: BoxFit.cover,
//                                   height: 200,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       product.descripcion,
//                                       style: const TextStyle(
//                                           fontSize: 14,
//                                           fontFamily: 'Roboto',
//                                           color: kValueColor),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: Text(
//                                       'Precio: \$${product.precio.toString()}',
//                                       style: const TextStyle(
//                                           fontSize: 10,
//                                           fontFamily: 'Roboto',
//                                           color: kValueColor),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         final cartProvider =
//                                             Provider.of<CartProvider>(context,
//                                                 listen: false);
//                                         cartProvider.addToCart(product);
//                                         Fluttertoast.showToast(
//                                           msg:
//                                               '¡${product.nombreProducto} se agregó al carrito!',
//                                           toastLength: Toast.LENGTH_SHORT,
//                                           gravity: ToastGravity.BOTTOM,
//                                           timeInSecForIosWeb: 1,
//                                           backgroundColor: Colors.grey[300],
//                                           textColor: Colors.black,
//                                           fontSize: 16.0,
//                                         );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                           backgroundColor: kValueColor),
//                                       child: const Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           SizedBox(
//                                             width: 2,
//                                           ),
//                                           Text('Agregar'),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
