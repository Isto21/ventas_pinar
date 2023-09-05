import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ventas_pinar/ventas_pinar/config/add_product.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/messages_page.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/pinterest_screen.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/selling_products.dart';
import 'package:ventas_pinar/ventas_pinar/ui/widgets/drawer_bar_widget.dart';
import 'package:ventas_pinar/ventas_pinar/ui/widgets/pinterest_bar.dart';

class HomePage extends StatelessWidget {
  final int index;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key, required this.index});

  List<Widget> pages = [
    PinterestPage(),
    SellProducts(),
    const Messages(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OptionSelected(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Ventas Pinar'),
          ),
          key: scaffoldKey,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              IndexedStack(
                index: index,
                children: pages,
              ),
              pinterestBar(context),
            ]),
          ),
          drawer: DrawerBar(),
          floatingActionButton: (index == 0)
              ? FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    final bool? response =
                        await context.push<bool>('/addProduct');
                    // print(response);
                    if (response == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Producto añadido con éxito")));
                    }
                  },
                )
              : null
          // body: Stack(children: [showProducts(), pinterestBar()]),
          ),
    );
  }

  Widget pinterestBar(BuildContext context) {
    return Positioned(
        bottom: 22,
        left: 100,
        right: 100,
        child: PinterestBar(
          items: [
            Items(
                onpress: () {
                  context.go('/homePage/0');
                },
                icon: Icons.shopping_cart),
            Items(
                onpress: () {
                  context.go('/homePage/1');
                },
                icon: Icons.sell),
            Items(
                onpress: () {
                  context.go('/homePage/2');
                },
                icon: Icons.sms),
          ],
          // activeColor: Color.fromARGB(255, 77, 11, 6),
          activeColor: Theme.of(context).colorScheme.primary,
          // inactiveColor: Colors.amber),
          inactiveColor: Theme.of(context).colorScheme.inversePrimary,
          boxShadow: Theme.of(context).colorScheme.onPrimaryContainer,
        ));
  }

  // void showSnack() {
  //   const snackBar = SnackBar(
  //     content: Text(
  //       "El producto fue añadido con éxito",
  //     ),
  //     duration: Duration(milliseconds: 1500),
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

  // }
}
