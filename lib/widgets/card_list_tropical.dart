import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/category_page.dart';
import 'package:test1/providers/products_provider.dart';
import 'package:test1/widgets/alert_dialog.dart';

class CardListTropical extends StatelessWidget {
  const CardListTropical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productsProvider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    productsProvider.productsTropical?.first.categoria.nombre ??
                        '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CategoryPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Mostrar más',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productsProvider.productsTropical?.length ?? 0,
              itemBuilder: (context, index) {
                final product = productsProvider.productsTropical![index];
                return modalProduct(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
