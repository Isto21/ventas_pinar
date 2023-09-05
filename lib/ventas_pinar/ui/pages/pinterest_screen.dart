import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:ventas_pinar/ventas_pinar/infra/models/product_model.dart';
import 'package:ventas_pinar/ventas_pinar/ui/providers/products_provider.dart';

class PinterestPage extends StatelessWidget {
  PinterestPage({super.key});
  final productsProvider = ProductsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: showProducts(),
      ),
    );
  }

  Widget showProducts() {
    return FutureBuilder(
      future: productsProvider.getProduct(),
      // initialData: InitialData,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        return (snapshot.hasData)
            ? showProductListTile(snapshot.data!)
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Cargando productos'),
                    const SizedBox(
                      height: 15,
                    ),
                    CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    )
                  ],
                ),
              );
      },
    );
  }

  Widget showProductListTile(List<ProductModel> product) {
    return GridView.custom(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: product.length,
        (context, index) => itemContainer(context, product, index),
      ),
    );
  }

  Widget itemContainer(
      BuildContext context, List<ProductModel> product, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Card(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8),
        //   color: Theme.of(context).primaryColor,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (product[index].fotoUrl == null)
                  ? const SizedBox()
                  : Image.network(
                      product[index].fotoUrl!,
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      product[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Stack(children: [
                    const Icon(
                      Icons.attach_money_rounded,
                      color: Colors.blueAccent,
                      size: 18,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          product[index].price.toString(),
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
