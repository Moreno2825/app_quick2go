import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test1/components/constants.dart';

import 'cash_confirmation.dart';

class PagoConfirmacionTabBar extends StatefulWidget {
  const PagoConfirmacionTabBar({super.key});

  @override
  State<PagoConfirmacionTabBar> createState() => _PagoConfirmacionTabBarState();
}

class _PagoConfirmacionTabBarState extends State<PagoConfirmacionTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _opcionSeleccionada = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
    _opcionSeleccionada = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        shape: const Border(bottom: BorderSide.none),
        title: const Text(
          'Método de pago',
          style:
              TextStyle(color: kWhiteColor, fontFamily: 'Roboto', fontSize: 17),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: kWhiteColor,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: kWhiteColor,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            color: kWhiteColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 58,
            color: kWhiteColor,
            child: TabBar(
              unselectedLabelColor: kValueLightColor,
              labelColor: kPrimaryColor,
              indicatorColor: kPrimaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pago.svg',
                        width: 24,
                        height: 24,
                      ),
                      const Text('Método de pago'),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/confirmar.svg',
                        width: 24,
                        height: 24,
                      ),
                      const Text('Confirmación'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Contenido de la pestaña de pago
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 15),
                      child: Text('Selecciona tu método de pago',
                          style: TextStyle(fontSize: 15, color: kValueColor)),
                    ),
                    RadioListTile(
                      title: const Text(
                        'Efectivo',
                        style: TextStyle(color: kValueBlackColor),
                      ),
                      value: 1,
                      groupValue: _opcionSeleccionada,
                      onChanged: (value) {
                        setState(() {
                          _opcionSeleccionada = value!;
                          // Habilitar la pestaña de confirmación solo si la opción 1 se selecciona
                          _tabController.animateTo(1);
                        });
                      },
                      activeColor: kPrimaryColor,
                      secondary: SvgPicture.asset(
                        'assets/icons/dollar.svg',
                        width: 24,
                        height: 24,
                        color: kValueBlackColor,
                      ),
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    // RadioListTile(
                    //   title: const Text(
                    //     'Paypal',
                    //     style: TextStyle(color: kValueBlackColor),
                    //   ),
                    //   value: 2,
                    //   groupValue: _opcionSeleccionada,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _opcionSeleccionada = value!;
                    //       // Deshabilitar la pestaña de confirmación si la opción 2 se selecciona
                    //       _tabController.animateTo(1);
                    //     });
                    //   },
                    //   activeColor: kPrimaryColor,
                    //   secondary: SvgPicture.asset(
                    //     'assets/paypal.svg',
                    //     width: 24,
                    //     height: 24,
                    //     color: kValueBlackColor,
                    //   ),
                    //   controlAffinity: ListTileControlAffinity.trailing,
                    // ),
                  ],
                ),
                // Contenido de la pestaña de confirmación
                // Contenido de la pestaña de confirmación, solo habilitado si la opción 1 se selecciona
                Column(
                  children: [
                    if (_opcionSeleccionada == 1) const CashConfirmation(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
