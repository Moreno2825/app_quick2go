import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/category_page.dart';
import 'package:test1/Pages/help_page.dart';
import 'package:test1/Pages/homepage.dart';
import 'package:test1/Pages/shoping_cart_page.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/providers/categories_provider.dart';
import 'package:test1/widgets/icons.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CategoriesProvider>(
              builder: (context, categoriesProvider, child) =>
                  categoriesProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final category
                                  in categoriesProvider.categories!)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
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
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CategoryPage()));
                                        },
                                        child: Card(
                                          semanticContainer: true,
                                          margin: const EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          elevation: 4,
                                          clipBehavior: Clip.antiAlias,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.network(
                                                  category.foto,
                                                  fit: BoxFit.fitWidth,
                                                  height: 200,
                                                ),
                                              ),
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                padding:
                                                    const EdgeInsets.symmetric(
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(
                      () {
                        //_selectedIndex = 0;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
                IconBottomBar(
                  text: "Categories",
                  icon: Icons.sell,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(
                      () {
                        //_selectedIndex = 1;
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const CategoriesPage(),
                        //   ),
                        // );
                      },
                    );
                  },
                ),
                IconBottomBar(
                  text: "Carrito",
                  icon: Icons.shopping_cart,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(
                      () {
                        _selectedIndex = 2;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
                IconBottomBar(
                  text: "Help",
                  icon: Icons.help_outlined,
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    setState(
                      () {
                        //_selectedIndex = 3;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HelpPage()));
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
