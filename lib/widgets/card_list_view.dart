import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/products_provider.dart';
import 'package:test1/widgets/alert_dialog.dart';

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

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
                    productsProvider.products?.first.categoria.nombre ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Acción a realizar al presionar el botón "Mostrar más"
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
              itemCount: productsProvider.products?.length ?? 0,
              itemBuilder: (context, index) {
                final product = productsProvider.products![index];
                return modalProduct(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
