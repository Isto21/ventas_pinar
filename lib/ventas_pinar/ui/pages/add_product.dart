import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ventas_pinar/ventas_pinar/infra/models/product_model.dart';
import 'package:ventas_pinar/ventas_pinar/ui/providers/products_provider.dart';

class AddProduct extends StatelessWidget {
  final Object? productData;
  AddProduct({super.key, this.productData});

  final formKey = GlobalKey<FormState>();
  ProductModel product = ProductModel();
  final productProvider = ProductsProvider();

  @override
  Widget build(BuildContext context) {
//     final ProductModel? productData = context.;
// print(productData?.name);
    if (productData != null) {
      ProductModel? p = productData as ProductModel?;
      product = p!;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Añadir producto'),
        actions: const [
          Icon(Icons.camera_alt_sharp),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              addProductTitle(),
              addProductPrice(),
              const SizedBox(
                height: 30,
              ),
              saveButton(context)
            ],
          ),
        ),
      ),
    );
  }

  TextButton saveButton(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          if (!formKey.currentState!.validate()) return;
            formKey.currentState?.save();
          if (product == null || product == '') {
            productProvider.postProduct(product);
          } else {
            productProvider.editProduct(product);
          }
          context.pop();
        },
        icon: const Icon(Icons.save),
        label: const Text('Guardar'));
  }

  Widget addProductTitle() {
    return TextFormField(
      onSaved: (newValue) => product.name = newValue!,
      initialValue: product.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(label: Text('Nombre del producto ')),
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget addProductPrice() {
    return TextFormField(
      onSaved: (newValue) => product.price = double.tryParse(newValue!)!,
      initialValue: product.price.toString(),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(label: Text('Precio ')),
      validator: (value) {
        final n = num.tryParse(value!);
        if (value.isEmpty || n == null) return 'Debe tener un precio';
        null;
      },
    );
  }
}
