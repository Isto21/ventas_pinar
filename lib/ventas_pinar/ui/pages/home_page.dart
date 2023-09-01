import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/messages_page.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/options_page.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/pinterest_screen.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/selling_products.dart';
import 'package:ventas_pinar/ventas_pinar/ui/widgets/pinterest_bar.dart';

class HomePage extends StatelessWidget {
  final int index;

  HomePage({super.key, required this.index});

  List<Widget> pages = [
    PinterestPage(),
    SellProducts(),
    const Messages(),
    const OptionsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          IndexedStack(
            index: index,
            children: pages,
          ),
          pinterestBar(context),
        ]),
        floatingActionButton: (index == 0)
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  final bool? response =
                      await context.push<bool>('/addProduct');
                  // print(response);
                  if (response == true) {
                    showSnackBar();
                  } 
                },
              )
            : null
        // body: Stack(children: [showProducts(), pinterestBar()]),
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
            Items(
                onpress: () {
                  context.go('/homePage/3');
                },
                icon: Icons.person),
          ],
          // activeColor: Color.fromARGB(255, 77, 11, 6),
          activeColor: Theme.of(context).primaryColor,
          // inactiveColor: Colors.amber),
          inactiveColor: Theme.of(context).disabledColor,
        ));
  }

  Widget showSnackBar() {
    return const SnackBar(
        content: Text(
      "El producto fue añadido con éxito",
    ));
  }
}
