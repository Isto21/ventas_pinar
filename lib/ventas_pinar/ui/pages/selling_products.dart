import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ventas_pinar/ventas_pinar/infra/models/product_model.dart';
import 'package:ventas_pinar/ventas_pinar/ui/providers/products_provider.dart';

class SellProducts extends StatelessWidget {
  SellProducts({super.key});

  ProductsProvider productsProvider = ProductsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis productos en venta'),
      ),
      body: FutureBuilder(
        future: productsProvider.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return (!snapshot.hasData)
              ? const Center(
                  child: Text('No tiene productos en venta'),
                )
              : showListProducts(snapshot.data);
        },
      ),
    );
  }

  Widget showListProducts(List<ProductModel> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete_forever),
          ),
          onDismissed: (direction) =>
              productsProvider.deleteProduct(products[index].id.toString()),
          child: ListTile(
              onTap: () => context.push('/AddProduct', extra: products[index]),
              title: Text(products[index].name),
              subtitle: Text(
                products[index].id.toString(),
              )),
        );
      },
    );
  }
}
