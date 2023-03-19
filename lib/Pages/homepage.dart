import 'package:flutter/material.dart';
import 'package:test1/Pages/help_page.dart';
import 'package:test1/Pages/perfiluser_page.dart';
import 'package:test1/Pages/shoping_cart_page.dart';
import 'package:test1/Pages/categories_page.dart';
import 'package:test1/components/constants.dart';
import 'package:test1/widgets/card_list_view.dart';
import 'package:test1/widgets/headline.dart';
import 'package:test1/widgets/icons.dart';
import 'package:test1/widgets/promo_card.dart';
import 'package:test1/widgets/search_input.dart';
import 'package:test1/widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // void _onItemTapped(int index){
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenido a Quick2Go',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
        backgroundColor: kPrimaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [TopBar(), PromoCard(), CardListView()],
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
                        _selectedIndex = 0;
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                      },
                    );
                    //Ver como hacer el ruteo
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CategoriesPage(),
                        ));
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ShopinCartPage()));
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
