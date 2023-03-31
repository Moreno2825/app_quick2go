import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Pages/category_page.dart';
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
        title: const Text('Categorias recientes'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ]),
                  child: CarouselSlider(
                    items: [
                      Image.network(
                        'https://getpaidstock.com/tmp/[GetPaidStock.com]-64240b7a2f898.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                        width: 700,
                      ),
                      Image.network(
                        'https://images.pexels.com/photos/5945867/pexels-photo-5945867.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        fit: BoxFit.cover,
                        height: 200,
                        width: 700,
                      ),
                      Image.network(
                        'https://images.pexels.com/photos/4443492/pexels-photo-4443492.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        fit: BoxFit.cover,
                        height: 200,
                        width: 700,
                      ),
                    ],
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 1),
                  ),
                ),
                Expanded(
                  child: SafeArea(
                    child: Consumer<CategoriesProvider>(
                      builder: (context, categoriesProvider, child) =>
                          categoriesProvider.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount:
                                      categoriesProvider.categories!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final category =
                                        categoriesProvider.categories![index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoryPage(),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        semanticContainer: true,
                                        margin: const EdgeInsets.only(
                                            bottom: 10, top: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        elevation: 2,
                                        clipBehavior: Clip.antiAlias,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Material(
                                              elevation: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.network(
                                                  category.foto,
                                                  fit: BoxFit.cover,
                                                  height: 180,
                                                  width: 150,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      category.nombre,
                                                      style: const TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 24),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    Text(
                                                      category.descripcion,
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'Paytone One',
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
